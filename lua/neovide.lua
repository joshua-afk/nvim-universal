if g.neovide then

  -- font family and font size
  o.guifont = "CaskaydiaCove Nerd Font:h14"

  -- Cursor animation
  g.neovide_cursor_vfx_mode = "railgun"

  -- Sets the transparency of the generated particles.
  g.neovide_cursor_vfx_opacity = 200.0

  -- Sets the amount of time the generated particles should survive.
  g.neovide_cursor_vfx_particle_lifetime = 1.2

  -- Sets the number of generated particles.
  g.neovide_cursor_vfx_particle_density = 7.0

  -- Sets the speed of particle movement.
  g.neovide_cursor_vfx_particle_speed = 10.0

  -- Only for the `railgun` vfx mode.
  -- Sets the mass movement of particles, or how individual each one acts.
  -- The higher the value, the less particles rotate in accordance to each other, the lower, the more line-wise all particles become.
  g.neovide_cursor_vfx_particle_phase = 1.5

  -- Only for the `railgun` vfx mode.
  -- Sets the velocity rotation speed of particles.
  -- The higher, the less particles actually move and look more "nervous", the lower, the more it looks like a collapsing sine wave.
  g.neovide_cursor_vfx_particle_curl = 1.0
end
