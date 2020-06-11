package io.codesquad.group11.issuetracker.lib.githuboauth;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GitHubUserData {

    private long id;
    private String login;
    private String email;

}
