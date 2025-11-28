import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    private var isValid: Bool { !email.isEmpty && password.count >= 6 && password == confirmPassword }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Create Account").font(.title.bold()).padding(.top, 40)
            
            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password (min 6 characters)", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
            
            if let error = authViewModel.errorMessage {
                Text(error).foregroundColor(.red).font(.caption)
            }
            
            Button {
                Task {
                    await authViewModel.signUp(email: email, password: password)
                    if authViewModel.isAuthenticated { dismiss() }
                }
            } label: {
                if authViewModel.isLoading { ProgressView() } else { Text("Sign Up") }
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isValid || authViewModel.isLoading)
            
            Spacer()
        }
    }
}
