//
//  ContentView.swift
//  DIKIDIOnline
//
//  Created by Максим Нурутдинов on 22.08.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var responseVM: ResponseViewModel = ResponseViewModel()
    
    var body: some View {
        NavigationView {
            if responseVM.isFinishedLoading {
                if responseVM.responseData?.errorMessage.code == 0 {
                    MainTabView(responseVM: responseVM)
                } else {
                    Text("error message is \(responseVM.responseData!.errorMessage.code)")
                    Text("error code is \(responseVM.responseData!.errorMessage.message ?? "no message")")
                }
            } else {
                ProgressView()
            }
        }
    }
}
