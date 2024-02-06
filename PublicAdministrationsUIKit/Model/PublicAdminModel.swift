//
//  PublicAdminModel.swift
//  PublicAdministrationsUIKit
//
//  Created by Peter Delgado on 9/10/23.
//

import Foundation

struct PublicAdministrationModel: Identifiable, Codable {
	let id, nombre: String?
	let urlFoto: String?
	let telefono: String?
	let poblacion: String?
	let direccion: String?
	let latitud, longitud: Double?
	let enabled: Bool?
	let mail, provincia, codigoPostal: String?
	let licencia: JSONNull?
	let licenciaNombre, licenciaApellidos, licenciaDni: String?
	let numero: String?
	let commercial: String?
	let mapImage: String?
}

typealias Welcome = [PublicAdministrationModel]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

	public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
		return true
	}

	public var hashValue: Int {
		return 0
	}

	public init() {}

	public required init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if !container.decodeNil() {
			throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encodeNil()
	}
}

