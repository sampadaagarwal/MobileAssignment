//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation


class ContentViewModel : ObservableObject {
    
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []
    

    func fetchAPI() {
        apiService.fetchDeviceDetails { [weak self] item in
            print("fetched: \(item)")
            DispatchQueue.main.async{
                self?.data = item
                print("xyz: \(String(describing: self?.data))")
            }
        }
    }
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
}
