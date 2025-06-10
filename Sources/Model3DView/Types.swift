/*
 * Types.swift
 * Created by Freek (github.com/frzi) on 08-08-2021.
 */

import GLTFSceneKit
import SceneKit
import SwiftUI

#if os(macOS)
public typealias PlatformImage = NSImage
public typealias PlatformColor = NSColor
typealias ViewRepresentable = NSViewRepresentable
#elseif os(iOS) || os(tvOS)
public typealias PlatformImage = UIImage
public typealias PlatformColor = UIColor
typealias ViewRepresentable = UIViewRepresentable
#endif

typealias IBLValues = (url: URL, intensity: Double)

public enum ModelLoadState {
	case success
	case failure
}

/// An internal type to help diffing the passed scene/file to `Model3DView`.
enum SceneFileType: Equatable {
	case reference(SCNScene)
	case url(URL?)
	
	static func == (lhs: SceneFileType, rhs: SceneFileType) -> Bool {
		if case .url(let l) = lhs, case .url(let r) = rhs {
			return l == r
		}
		else if case .reference(let l) = lhs, case .reference(let r) = rhs {
			return l == r
		}
		return false
	}
}
