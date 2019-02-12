
scrumpoker_sources = [
  'Main.vala',
  'Window.vala',
  'Templates.vala',
  'ScrumPoker.vala'
]

scrumpoker_deps = [
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('libhandy-0.0', version: '>= 0.0.5')
]

c_args = [
  '-DHANDY_USE_UNSTABLE_API'
]

executable(
  meson.project_name(),
  scrumpoker_sources,
  c_args: c_args,
  dependencies: scrumpoker_deps,
  install: true
)