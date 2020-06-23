package io.codesquad.group11.issuetracker.domain.user.domain;

import io.codesquad.group11.issuetracker.lib.githuboauth.GitHubUserData;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true, nullable = false)
    private Long githubId;
    private String githubLogin;
    private String githubEmail;
    private String avatarUrl;

    public User(GitHubUserData githubUserData) {
        githubId = githubUserData.getId();
        githubLogin = githubUserData.getLogin();
        githubEmail = githubUserData.getEmail();
        avatarUrl = githubUserData.getAvatarUrl();
    }

}
