import SwiftSpeech
import SwiftUI

func noop() {}

extension View {
    func swiftSpeechRecordOnHoldWithTap(
        sessionConfiguration: SwiftSpeech.Session.Configuration = SwiftSpeech.Session.Configuration(),
        animation: Animation = SwiftSpeech.defaultAnimation,
        distanceToCancel: CGFloat = 50.0,
        tapAction: @escaping () -> Void = noop,
        tapDuration: Double = 100
    ) -> ModifiedContent<Self, RecordOnHoldWithTap> {
        modifier(
            RecordOnHoldWithTap(
                sessionConfiguration: sessionConfiguration,
                animation: animation,
                distanceToCancel: distanceToCancel,
                tapAction: tapAction,
                tapDuration: tapDuration
            )
        )
    }

    func swiftSpeechRecordOnHoldWithTap(
        locale: Locale,
        animation: Animation = SwiftSpeech.defaultAnimation,
        distanceToCancel: CGFloat = 50.0,
        tapAction: @escaping () -> Void = noop,
        tapDuration: Double = 100
    ) -> ModifiedContent<Self, RecordOnHoldWithTap> {
        swiftSpeechRecordOnHoldWithTap(
            sessionConfiguration: SwiftSpeech.Session.Configuration(locale: locale),
            animation: animation,
            distanceToCancel: distanceToCancel,
            tapAction: tapAction,
            tapDuration: tapDuration
        )
    }
}

struct RecordOnHoldWithTap: ViewModifier {
    public init(sessionConfiguration: SwiftSpeech.Session.Configuration = SwiftSpeech.Session.Configuration(), animation: Animation = SwiftSpeech.defaultAnimation, distanceToCancel: CGFloat = 50.0, tapAction: @escaping () -> Void = noop, tapDuration: Double = 100) {
        self.sessionConfiguration = sessionConfiguration
        self.animation = animation
        self.distanceToCancel = distanceToCancel
        self.tapAction = tapAction
        self.tapDuration = tapDuration
    }

    var sessionConfiguration: SwiftSpeech.Session.Configuration
    var animation: Animation
    var distanceToCancel: CGFloat
    var tapAction: () -> Void
    var tapDuration: Double

    @SpeechRecognitionAuthStatus var authStatus

    @State var recordingSession: SwiftSpeech.Session? = nil
    @State var viewComponentState: SwiftSpeech.State = .pending

    var delegate = SwiftSpeech.FunctionalComponentDelegate()

    var gesture: some Gesture {
        let tap = TapGesture().onEnded { tapAction() }

        let longPress = LongPressGesture(minimumDuration: 10)
            .onChanged { value in
                if value {
                    withAnimation(self.animation, self.startRecording)
                }
            }

        let tapWithPress = ExclusiveGesture(tap, longPress)

        let drag = DragGesture(minimumDistance: 0)
            .onChanged { value in
                if self.viewComponentState != .pending {
                    withAnimation(self.animation) {
                        if value.translation.height < -self.distanceToCancel {
                            self.viewComponentState = .cancelling
                        } else {
                            self.viewComponentState = .recording
                        }
                    }
                }
            }
            .onEnded { value in
                if self.viewComponentState != .pending {
                    if value.translation.height < -self.distanceToCancel {
                        withAnimation(self.animation, self.cancelRecording)
                    } else {
                        withAnimation(self.animation, self.endRecording)
                    }
                }
            }

        return tapWithPress.simultaneously(with: drag)
    }

    public func body(content: Content) -> some View {
        content
            .gesture(gesture, including: $authStatus ? .gesture : .none)
            .environment(\.swiftSpeechState, viewComponentState)
    }

    fileprivate func startRecording() {
        let id = SpeechRecognizer.ID()
        let session = SwiftSpeech.Session(id: id, configuration: sessionConfiguration)
        // View update
        viewComponentState = .recording
        recordingSession = session
        delegate.onStartRecording(session: session)
        session.startRecording()
    }

    fileprivate func cancelRecording() {
        guard let session = recordingSession else { preconditionFailure("recordingSession is nil in \(#function)") }
        session.cancel()
        delegate.onCancelRecording(session: session)
        viewComponentState = .pending
        recordingSession = nil
    }

    fileprivate func endRecording() {
        guard let session = recordingSession else { preconditionFailure("recordingSession is nil in \(#function)") }
        recordingSession?.stopRecording()
        delegate.onStopRecording(session: session)
        viewComponentState = .pending
        recordingSession = nil
    }
}
