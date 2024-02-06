//
//  PublicAdminViewModel.swift
//  PublicAdministrationsUIKit
//
//  Created by Peter Delgado on 9/10/23.
//

import Foundation
import Combine


class PubliAdminstrationsViewModel: ObservableObject {

	@Published var allAdmins: [PublicAdministrationModel] = []
	@Published var searchText: String = ""

	private let adminService = PublicAdministrationService()
	private var cancellables = Set<AnyCancellable>()

	init() {
		addSubscribers()
	}

	func addSubscribers() {

		$searchText.combineLatest(adminService.$allAdministrations)
			.map{ (text, startingAdmins) -> [PublicAdministrationModel] in

				guard !text.isEmpty else{
					return startingAdmins
				}
				let lowerCase = text.lowercased()
				return startingAdmins.filter { (admin) -> Bool in
					return admin.nombre?.lowercased().contains(lowerCase) ?? false
				}
			}
			.sink { [weak self] (returnedAdmins) in
				self?.allAdmins = returnedAdmins
			}
			.store(in: &cancellables)
	}
}
