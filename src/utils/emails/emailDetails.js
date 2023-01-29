const forgetPasswordEmailDetails = (user, token, host) => {
    return {
        subject: "Reset Password",
        message: `
                <p>Hey ${user.firstname}, </p>
                <br/>
                <p>Someone (hopefully you) has requested a password reset for your Savecoins account. Follow the link below to set a new password:</p>
                <a href="http://${host}/api/auth/reset-password/${token}" rel="noopener noreferrer" style="text-decoration:none;color:#ffffff;line-height:42px;display:block;background-color: #4CAF50;font-size: 16px;text-align: center;padding: 15px 32px;margin: 4px 2px;cursor: pointer;" target="_blank">Reset Password</a>
                <p>If you don't wish to reset your password, disregard this email and no action will be taken..</p>
                
        
                <p>Thank you!!</p>
                <p>The Savecoins Team</p>
                <br/>
                `,
        to: user.email,
    }
}

const createAgentEmailDetails = (name, email, password, host) => {
    return {
        subject: "Glow Capture Agent Access",
        message: `
            <p>Hi ${name}, </p>
            <br/>
            <p>You now have agent access to the Glow Capture app.</p>
            <p>Login with the following credentials:</p>
            <p>email: ${email}</p>
            <p>password: ${password}</p>
    
            <p>The Glow Capture Team</p>
            <br/>
            `,
      to: email,
    }
}

module.exports = {
    forgetPasswordEmailDetails,
    createAgentEmailDetails
}