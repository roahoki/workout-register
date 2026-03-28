exercises = [
  { name: "Push-up", muscle_group: :push, description: "Classic bodyweight push-up. Hands shoulder-width apart, full range of motion." },
  { name: "Pike Push-up", muscle_group: :push, description: "Targets shoulders. Hips raised high, lower head toward floor." },
  { name: "Dip", muscle_group: :push, description: "Parallel bar or ring dips. Full depression at top, 90° at bottom." },
  { name: "Diamond Push-up", muscle_group: :push, description: "Hands form a diamond shape, emphasizes triceps." },
  { name: "Archer Push-up", muscle_group: :push, description: "Wide hands, shift weight to one arm. Builds toward one-arm push-up." },
  { name: "Handstand Push-up", muscle_group: :push, description: "Inverted press against wall or freestanding. Advanced shoulder strength." },
  { name: "Pull-up", muscle_group: :pull, description: "Overhand grip, full dead hang to chin over bar." },
  { name: "Chin-up", muscle_group: :pull, description: "Underhand grip. More bicep activation than pull-up." },
  { name: "Australian Row", muscle_group: :pull, description: "Horizontal pull under a bar or rings. Great pull-up progression." },
  { name: "Muscle-up", muscle_group: :pull, description: "Dynamic pull-up transitioning above the bar. Advanced skill." },
  { name: "Archer Pull-up", muscle_group: :pull, description: "One arm assists while the other does the majority. One-arm progression." },
  { name: "L-sit Pull-up", muscle_group: :pull, description: "Pull-up with legs held parallel to floor. Combines pull and core." },
  { name: "Squat", muscle_group: :legs, description: "Bodyweight squat. Full depth, knees tracking over toes." },
  { name: "Bulgarian Split Squat", muscle_group: :legs, description: "Rear foot elevated. Targets single-leg strength and balance." },
  { name: "Pistol Squat", muscle_group: :legs, description: "Single-leg squat to full depth. Advanced lower body skill." },
  { name: "Lunge", muscle_group: :legs, description: "Forward or reverse lunge. Alternating or walking." },
  { name: "Jump Squat", muscle_group: :legs, description: "Explosive squat with full jump. Power and conditioning." },
  { name: "Calf Raise", muscle_group: :legs, description: "Single or double leg on edge. Full range of motion." },
  { name: "L-sit", muscle_group: :core, description: "Legs parallel to ground on parallettes or floor. Isometric core hold." },
  { name: "Plank", muscle_group: :core, description: "Straight-arm or forearm. Full body tension, neutral spine." },
  { name: "Hollow Body Hold", muscle_group: :core, description: "Lower back pressed into floor, arms and legs extended and raised." },
  { name: "Dragon Flag", muscle_group: :core, description: "Laying on bench, body straight and lowering with core control." },
  { name: "Hanging Knee Raise", muscle_group: :core, description: "Dead hang, raise knees to chest. Progression to hanging leg raise." },
  { name: "Hanging Leg Raise", muscle_group: :core, description: "Dead hang, raise straight legs to parallel or higher." },
  { name: "Ab Wheel Rollout", muscle_group: :core, description: "Extend forward from knees or feet. Advanced anti-extension core." },
  { name: "Burpee", muscle_group: :full_body, description: "Squat thrust with push-up and jump. High intensity full body." },
  { name: "Bear Crawl", muscle_group: :full_body, description: "Hands and feet, knees hovering. Builds coordination and endurance." },
  { name: "Man Maker", muscle_group: :full_body, description: "Burpee variation with rows. Full body compound movement." }
]

exercises.each do |attrs|
  Exercise.find_or_create_by!(name: attrs[:name]) do |e|
    e.muscle_group = attrs[:muscle_group]
    e.description = attrs[:description]
  end
end

puts "Seeded #{Exercise.count} exercises."
