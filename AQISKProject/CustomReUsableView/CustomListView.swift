//
//  CustomListView.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import Foundation
import SwiftUI

/// A customizable view to represent a single row in a list, displaying an icon, label, and value.
struct CustomListRowView: View {
    /// The name of the icon in SF Symbols.
    @State var rowIcon: String
    /// The label or title for the row.
    @State var rowLabel: String
    /// The value or content for the row.
    @State var rowValue: String
    /// The tint color for the icon and label.
    @State var rowTintColor: Color

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 30, height: 30)
                    .foregroundColor(rowTintColor)
                Image(systemName: rowIcon)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            Text(rowLabel)
                .foregroundColor(rowTintColor)
            Text(rowValue)
        }
    }
}

