//
//  PDCommentsList.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/22/24.
//

import SwiftUI

struct PDList<T: Hashable, Label: View>: View {
    @Binding var trees: [TreeNode<T>]
    
    var label: (T) -> Label
    
    // MARK: - Body
    var body: some View {
        AppList(items: trees) { rootTree in
            Section {
                OutlineGroup(rootTree, children: \.children) { tree in
                    HStack {
                        label(tree.value)
//                            .background(.red)
                            .padding()
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("1")
                        }
                        
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.block)
                    }
                }
            }
        }
    }
}
