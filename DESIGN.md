# Design System Specification: Neon-Editorial Dark Mode

## 1. Overview & Creative North Star

### The Creative North Star: "Cyber-Organic Brutalism"

This design system rejects the "safe" corporate aesthetic in favor of a high-contrast, tech-forward identity. It balances the raw, structural energy of Brutalism - bold typography and unyielding layouts - with an "organic" tech feel through glassmorphism and soft tonal depth.

The system is designed to feel like a premium digital artifact: dark, immersive, and vibrating with neon energy. We move beyond the grid by using overlapping elements, aggressive corner radii, and a "vanta-black" foundation that allows our primary cyan (`#81ecff`) and secondary lime (`#9ffb00`) to act as functional light sources within the UI.

---

## 2. Color Theory & Surface Architecture

The palette is rooted in deep obsidian tones, using neon accents not just for decoration, but as high-contrast indicators of action and community vitality.

### The "No-Line" Rule

Explicit instruction: 1px solid borders are prohibited for sectioning. Structural boundaries must be defined solely through background color shifts. Use `surface-container-low` for sections resting on a `surface` background. If you need to separate content, use white space from the spacing scale or a subtle shift to `surface-bright`.

### Surface Hierarchy & Nesting

Treat the UI as a series of physical layers. We use Material 3-style tonal tiers to define depth:

- Base: `background` (`#0e0e0e`)
- Tier 1 (Sections): `surface-container-low` (`#131313`)
- Tier 2 (Cards): `surface-container` (`#1a1a1a`) or `tertiary` (`#f9f9f9`) for high-impact content
- Tier 3 (Pop-overs/Modals): `surface-container-high` (`#20201f`)

### The Glass & Gradient Rule

To achieve a signature look, floating elements like navigation bars or tooltips should use glassmorphism. Apply a semi-transparent `surface-container` color with a `backdrop-blur` of `20px` to `40px`.

- Signature texture: Use a subtle linear gradient transitioning from `primary` (`#81ecff`) to `primary-container` (`#00e3fd`) for hero CTAs to provide a pulsing digital soul.

---

## 3. Typography: The Editorial Voice

We utilize a tri-font system to establish a clear, sophisticated hierarchy.

- Display & Headlines (`Plus Jakarta Sans`): Our voice. Use `display-lg` for hero moments to create a sense of tech-forward authority.
- Titles & Body (`Work Sans`): Our information. Use `title-md` for card headers to ensure legibility against dark backgrounds.
- Labels (`Space Grotesk`): Our utility. Use this for technical data, chips, and small metadata to reinforce the community-coded feel.

---

## 4. Elevation & Depth: Tonal Layering

Traditional drop shadows are largely replaced by tonal stacking.

- The layering principle: Place a `surface-container-lowest` card on a `surface-container-low` section. The small luminosity difference creates a soft, natural lift that feels integrated rather than pasted on.
- Ambient shadows: For floating action buttons or high-level modals, use extra-diffused shadows with `blur: 32px`, `spread: 0`, `opacity: 8%`. The shadow color must be a tinted version of the surface, never pure black.
- The ghost border fallback: If a border is required for accessibility, use `outline-variant` at `20%` opacity. Fully opaque borders are forbidden because they break the immersive dark-mode flow.
- Glassmorphism: Use `surface-variant` at `60%` opacity with backdrop blur for cards that overlap photographic backgrounds.

---

## 5. Components

### Buttons

- Primary: Solid `primary` (`#81ecff`) with `on-primary` (`#005762`) text
- Sizing: height `56px`
- Radius: `full` pill shape to contrast the card geometry
- Secondary: Ghost-style with `primary` text and a `primary` `10%` opacity fill
- Tertiary: `secondary` (`#9ffb00`) used exclusively for community or success actions

### Cards & Lists

- Structure: No divider lines. Use `spacing-6` (`1.5rem`) to separate list items.
- Neon accents: Apply a `4px` vertical accent stripe of `secondary` or `primary` on the left or bottom edge of cards to indicate status.
- Radius: Cards use `xl` (`1.5rem`) or `lg` (`1rem`).

### Input Fields

- Surface: `surface-container-highest` (`#262626`)
- State: On focus, the container should not use a border, but a `primary` outer glow with `4px` spread at `20%` opacity
- Typography: Labels must use `label-md` (`Space Grotesk`) in `on-surface-variant`

### Progress Indicators (The "Tribal" Bar)

- Track: `surface-variant` at `24px` height
- Indicator: A dual-gradient from `secondary` (`#9ffb00`) to `primary` (`#81ecff`)

---

## 6. Do's and Don'ts

### Do

- Use intentional asymmetry. Place images off-center or overlapping card boundaries to create energy.
- Leverage `secondary` lime for community-centric elements to separate system actions from people actions.
- Ensure all photographic elements use a dark-tinted overlay of `20%` to `40%` to maintain text contrast.

### Don't

- Do not use `1px` solid borders to define the grid.
- Do not use pure white (`#FFFFFF`) for body text; use `on-surface-variant` (`#adaaaa`) to reduce eye strain in dark environments.
- Do not use standard Material blue; use the specified cyan primary to maintain the signature neon aesthetic.
- Do not use sharp `90-degree` corners. Everything should feel molded with at least an `md` (`0.75rem`) radius.

---

## 7. Spacing & Rhythm

This system relies on generous breathing room.

- Container padding: minimum `8` (`2rem`) for all main containers
- Stacking: use `4` (`1rem`) for related elements and `10` (`2.5rem`) for new content blocks
- The grid: internal alignment should respect the `0.25rem` (`4px`) base unit
