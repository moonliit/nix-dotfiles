{
  # Highlight todo, notes, etc in comments
  # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
  plugins.todo-comments = {
    enable = true;
    lazyLoad = {
      enable = false; #true;
      settings = {
        cmd = "TodoTelescope";
      };
    };

    settings = {
      signs = true;
    };
  };
}
