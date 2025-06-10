import SwiftUI

/// A view modifier that provides snapshot handler functionality to a Model3DView.
public struct SnapshotHandlerModifier: ViewModifier {
	@Binding private var snapshotHandler: SnapshotHandler?
	
	public init(handler: Binding<SnapshotHandler?>) {
		self._snapshotHandler = handler
	}
	
	public func body(content: Content) -> some View {
		content
			.environment(\.snapshotHandlerBinding, $snapshotHandler)
	}
}

extension View {
	/// Provides a snapshot handler binding to capture renders from a Model3DView.
	///
	/// - Parameter handler: A binding to an optional SnapshotHandler that will be populated
	///   when the Model3DView is ready for capturing.
	/// - Returns: A view with snapshot handler functionality enabled.
	public func snapshotHandler(_ handler: Binding<SnapshotHandler?>) -> some View {
		modifier(SnapshotHandlerModifier(handler: handler))
	}
} 