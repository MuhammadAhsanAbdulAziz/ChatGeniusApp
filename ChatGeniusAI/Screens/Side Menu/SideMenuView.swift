//
//  SideMenuView.swift
//  ChatGeniusAI
//
//  Created by Apple on 11/10/2024.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    @State var isOptionShowing = false
    @State var isFAQActive = false
    @State var isFAQShowing = false
    @State var isSupportDialogShowing = false
    
    var body: some View {
        HStack {
            
            ZStack{
                
                VStack(alignment: .leading, spacing: 0) {
                    ProfileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 30)
                    
                    
                    HStack {
                        Text("More Options")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                        
                        Image(systemName: "chevron.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.white)
                    }
                    .padding(10)
                    .background(Color.clear)  // Optional, to ensure the background stays transparent
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)  // Apply rounded corners
                            .stroke(Color.white, lineWidth: 2)  // White border with line width 2
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.leading,10)
                    .onTapGesture {
                        isOptionShowing.toggle()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    if isOptionShowing {
                        
                        HStack{
                            Spacer()
                                .frame(width: 20)
                            VStack(alignment:.leading,spacing:20){
                                Button(action: {
                                    // Close the option dialog and navigate to FAQ
                                    isOptionShowing = false
                                    isFAQActive = true  // Trigger navigation
                                }) {
                                    Text("FAQ")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.white)
                                }
                                Text("Support")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        withAnimation {
                                            isSupportDialogShowing.toggle()
                                        }
                                    }
                                Text("Share App on Appstore")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        openAppStore()
                                        isOptionShowing.toggle()
                                    }
                                
                            }
                            .padding(20)
                            .padding(.trailing,30)
                            
                            .background(Color.black)  // Optional, to ensure the background stays transparent
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)  // Apply rounded corners
                                    .stroke(Color.gray, lineWidth: 2)  // White border with line width 2
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .frame(width:150)
                            
                            
                        }
                    }
                    
                    Spacer()
                    
                    
                    Divider()
                        .frame(height: 2)
                        .background(.white)
                    
                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    
                }
                .frame(width: 270)
                .background(
                    .app
                )
                
            }
            .overlay(alignment: .topTrailing, content: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .padding()
                    .onTapGesture {
                        presentSideMenu.toggle()
                    }
            })
            
            
            Spacer()
        }
        
        .background(.clear)
        .navigationLinkHack(isActive: $isFAQActive)
        .overlay {
            if isSupportDialogShowing {
                SupportDialog(isSupportDialogShowing: $isSupportDialogShowing)
            }
        }
    }
    
    func openAppStore() {
            let appID = "<APP_ID>" // Replace with your app's App Store ID
            if let url = URL(string: "https://apps.apple.com/app/id\(appID)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    
    func ProfileImageView() -> some View{
        VStack(alignment: .center){
            HStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                Spacer()
            }
            
            Text("ChatGenius AI")
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.system(size: 20,weight: .bold))
            
        }
    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Spacer()
                        .frame(width: 10)
                    ZStack{
                        Image(systemName:imageName )
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                }
            }
        }
        .frame(height: 50)
        
    }
}


extension View {
    func navigationLinkHack(isActive: Binding<Bool>) -> some View {
        background(
            NavigationLink(destination: FAQScreen(), isActive: isActive) {
                EmptyView()
            }
                .hidden()
        )
    }
}
