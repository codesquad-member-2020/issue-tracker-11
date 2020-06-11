package io.codesquad.group11.issuetracker.domain.user.domain;

import io.codesquad.group11.issuetracker.domain.user.data.UserRepository;
import io.codesquad.group11.issuetracker.lib.githuboauth.GitHubUserData;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void addUserIfNew(GitHubUserData gitHubUserData) {
        if (!userRepository.existsByGithubId(gitHubUserData.getId())) {
            userRepository.save(new User(gitHubUserData));
        }
    }

}
