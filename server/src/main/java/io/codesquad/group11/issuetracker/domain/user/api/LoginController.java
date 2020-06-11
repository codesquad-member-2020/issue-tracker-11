package io.codesquad.group11.issuetracker.domain.user.api;

import io.codesquad.group11.issuetracker.domain.user.domain.UserService;
import io.codesquad.group11.issuetracker.lib.githuboauth.GitHubUserData;
import io.codesquad.group11.issuetracker.lib.githuboauth.JwtService;
import io.codesquad.group11.issuetracker.lib.githuboauth.OAuthService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class LoginController {

    private final OAuthService oAuthService;
    private final JwtService jwtService;
    private final UserService userService;

    public LoginController(OAuthService oAuthService, JwtService jwtService, UserService userService) {
        this.oAuthService = oAuthService;
        this.jwtService = jwtService;
        this.userService = userService;
    }

    @GetMapping("/login")
    public void login(HttpServletResponse response) throws IOException {
        oAuthService.redirectToGitHubAuthorization(response);
    }

    @GetMapping("/oauth/github")
    public void oauth(@RequestParam String code, HttpServletResponse response) throws IOException {
        GitHubUserData gitHubUserData = oAuthService.getGitHubUserData(code);
        userService.addUserIfNew(gitHubUserData);
        String jwt = jwtService.buildJwt(gitHubUserData);
        // response.addCookie(new Cookie("token", jwt));
        // response.sendRedirect("http://localhost:8080/");
        response.sendRedirect("io.codesquad.issuetracker.app:/?token=" + jwt);
    }

}
