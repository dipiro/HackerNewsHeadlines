//
//  WidgetView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/19/24.
//

import SwiftUI

struct WidgetView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.isPresented) private var isPresented
    @Environment(TBStateViewModel.self) private var tabBarState
    @State private var viewModel = WViewModel(post: Post.preview)
    
    // MARK: - Body
    var body: some View {
        VStack {
            preview
            form
        }
        .navigationTitle("Widget Customization")
        .toolbarTitleDisplayMode(.inline)
        .toolbar() {
            ToolBarItemSave {
                viewModel.save()
                dismiss()
            }
        }
        .background(Color.background)
        .onAppear() {
            tabBarState.toggleTabBarState(isPresented)
        }
        .onChange(of: isPresented, { _, newValue in
            tabBarState.toggleTabBarState(newValue)
        })
    }
}

// MARK: - Private
private extension WidgetView {
    var preview: some View {
        WPreview()
            .environment(viewModel)
    }
    
    var form: some View {
        WForm(items: WRowType.allCases, label: creatingRow)
    }
    
    func creatingRow(for type: WRowType) -> some View {
        switch type {
        case .backgroundColor:
            SColorCell(type.rawValue, colorHex: $viewModel.bgColorHex)
        case .textColor:
            SColorCell(type.rawValue, colorHex: $viewModel.textColorHex)
        }
    }
}

// MARK: - Preview
#Preview {
    WidgetView()
        .environment(TBStateViewModel())
}
