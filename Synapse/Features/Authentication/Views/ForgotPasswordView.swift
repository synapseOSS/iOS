import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var sent = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                if sent {
                    Image(systemName: "envelope.badge.fill").font(.system(size: 60)).foregroundColor(.green)
                    Text("Check your email for reset instructions").multilineTextAlignment(.center)
                } else {
                    Text("Enter your email to reset password")
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                    
                    Button {
                        Task { await authViewModel.resetPassword(email: email); sent = true }
                    } label: {
                        if authViewModel.isLoading { ProgressView() } else { Text("Send Reset Link") }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(email.isEmpty || authViewModel.isLoading)
                }
                Spacer()
            }
            .padding(.top, 40)
            .navigationTitle("Reset Password")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Close") { dismiss() } } }
        }
    }
}
