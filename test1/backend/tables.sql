-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2024 at 03:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test1_ambw_c14210004`
--

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_workout` varchar(100) NOT NULL,
  `thumbnail` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `nama_workout`, `thumbnail`) VALUES
(1, 'Yoga', 'image-1.webp'),
(2, 'Pilates', 'image-1.webp'),
(3, 'Full Body', 'image-1.webp'),
(4, 'Stretching', 'image-1.webp');

-- --------------------------------------------------------

--
-- Table structure for table `workout_excercies`
--

CREATE TABLE `workout_excercies` (
  `id` int(10) UNSIGNED NOT NULL,
  `workout_id` int(10) UNSIGNED NOT NULL,
  `nama_workout` varchar(100) NOT NULL,
  `thumbnail` varchar(40) NOT NULL,
  `menit` int(10) UNSIGNED NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workout_excercies`
--

INSERT INTO `workout_excercies` (`id`, `workout_id`, `nama_workout`, `thumbnail`, `menit`, `deskripsi`) VALUES
(1, 1, 'Plank', 'image-1.webp', 1, '<ul>\r\n<li>Start on your all fours, with hands directly under your shoulders and knees parallel to each other.</li>\r\n<li>Straighten your legs out behind you one at a time.</li>\r\n<li>Make sure your back is straight and that you aren’t arching or rounding it, as this takes away from the benefits of the pose.</li>\r\n<li>Engage your core, legs, and arms throughout the pose and looks slightly forward and in between your hands.</li>\r\n<li>Hold this pose for 30 seconds.</li>\r\n</ul>'),
(4, 1, 'Three Legged Dog', 'image-2.webp', 1, '<ul>\r\n<li>From plank, push back into your Downward Dog as you simultaneously lift your right leg high up into the air.</li>\r\n<li>Make sure to engage your core in this pose so all the weight doesn’t fall onto your arms.</li>\r\n<li>Really push the leg in the air higher and higher as you ground through your foot on the mat.</li>\r\n<li>You will feel a big stretch in your glutes and hamstrings in this pose.</li>\r\n<li>Remember to hold three legged dog for 30 seconds.</li>\r\n</ul>'),
(11, 1, 'High Lunge', 'image-3.webp', 1, '<ul>\r\n<li>Bend your right knee and curl it into your chest and then place your foot between both hands.</li>\r\n<li>Ground your right foot with your front knee bent as you rise up into High Lunge.</li>\r\n<li>Push through your back heel and extend through your arms as your deepen into your front knee.</li>\r\n<li>Hold high lunge pose for 30 seconds.</li>\r\n</ul>'),
(12, 1, 'Warrior II', 'image-4.webp', 1, '<ul>\r\n<li>Ground your back foot at an angle as you open your body up to the left side of the room and sweep your arms from above your head to straight out and shoulder height.</li>\r\n<li>Let your gaze fall over your right fingertips.</li>\r\n<li>Don’t let your front leg lose the bend! Try to sink deeper with each exhale and ground through both feet.</li>\r\n</ul>'),
(13, 1, 'Peaceful Warrior', 'image-5.webp', 1, '<ul>\r\n<li>Your back arm slides down your leg as your front arm comes up overhead.</li>\r\n<li>Flip your front palm and arch your back as you bend backward, placing your left hand on your left back thigh and bring your right arm up overhead.</li>\r\n<li>Be mindful of keeping your front leg bent.</li>\r\n<li>You will feel a nice deep side stretch in your side here.</li>\r\n</ul>'),
(14, 1, 'Warrior III', 'image-6.webp', 1, '<ul>\r\n<li>As you come out of your peaceful warrior back into Warrior II, shift your weight into your right leg and tilt your body forward, lifting your left leg off the ground.</li>\r\n<li>Flex your back foot. Try to keep it at hip height.</li>\r\n</ul>'),
(15, 1, 'Chair', 'image-7.webp', 1, '<ul>\r\n<li>Bend your right knee slightly and begin to float down from Warrior III.</li>\r\n<li>Bring your left foot to meet your right, then bend at your knees and lift through your chest.</li>\r\n<li>Sink your seat as close to the ground as you can while you raise up with your fingertips towards the ceiling.</li>\r\n<li>Adjust your legs to ensure one leg isn’t more forward than the other and keep your core engaged.</li>\r\n</ul>'),
(16, 1, 'Standing Forward Bend', 'image-8.webp', 1, '<ul>\r\n<li>From Chair Pose, drop your hands to the ground, then straighten your legs.</li>\r\n<li>Make sure your back is straight and you are not letting your chest cave in.</li>\r\n<li>Lengthen through your spine and ground through your feet. Release your head and neck.</li>\r\n</ul>'),
(17, 2, 'Crisscross', 'image-1.webp', 2, '<p>Lie on floor with legs raised, knees bent 90 degrees, shins parallel to the floor. Hold a yoga block at your chest with both hands, elbows flared, to start. Inhale, then exhale and extend right leg while you lift right shoulder and rotate toward left knee. Inhale to return to starting position, then repeat on right side for 1 rep.</p>'),
(18, 2, 'Hundred', 'image-2.webp', 1, '<p>Lie on floor with legs raised, knees bent 90 degrees, shins parallel to floor, a resistance band behind arches of feet and holding other ends, arms along torso. Exhale, lift shoulders off floor, press rib cage into mat, and extend legs to start. Inhale for 5 pulses, while performing small beats with arms, initiating from shoulders. Continue with an exhale for 5 pulses. Repeat for 10 reps or 100 pulses.</p>'),
(19, 2, 'Saw', 'image-3.webp', 1, '<p>Sit on floor, legs extended, heels wider than hips, arms extended to sides, and palms facing forward, to start. Inhale and rotate torso clockwise, then exhale, fold forward, and reach left palm to left foot. Inhale and reverse rotation, then exhale and return to start. Repeat on right side for 1 rep.</p>'),
(20, 2, 'Double Leg Stretch', 'image-4.webp', 2, '<p>Lie on floor, then raise head, neck, and shoulders; raise legs, bending knees at 90 degrees, shins parallel to the floor to start. Inhale and point fingertips toward heels, then exhale, extend legs so they are at a 45-degree angle to the floor, and reach fingertips behind head. Inhale to return to the start for 1 rep.</p>'),
(21, 2, 'Swimming', 'image-5.webp', 1, '<p>Lie on stomach, with legs, torso, and arms farming a straight line, holding a yoga block horizontally. Inhale, then exhale and lift chest, arms, and legs off floor to start. Inhale while lifting and lowering legs, like a swimmer’s kick, for 5 pulses. Exhale and repeat sequence—20 pulses total—for 1 rep. Inhale, then exhale and lower entire body to the mat.</p>'),
(22, 2, 'Corkscrew', 'image-6.webp', 2, '<p>Lie on back, arms along sides, legs straight at a 45-degree angle to floor to start. Inhale, bring legs toward torso and roll spine off mat into a hover position—hips are off the ground and tipped back, feet are overhead. Exhale, press through hands and tilt legs to left as you roll down the spine through center at a 45-degree angle. Tilt legs to right and roll back up to hover to complete a circle. Repeat in opposite direction for 1 rep.</p>'),
(23, 3, 'Squats', 'image-1.webp', 2, '<p>Start by standing with your feet directly under your hips. Hinge at the hips and sit back like you would into a chair until your thighs are parallel to the floor, or until your legs are at “no less than a 90-degree angle,” Gaines says. Next, stand up again quickly, engaging your core and glutes as you rise. “You can either use your body weight or add more resistance [with weights].”</p>\r\n\r\n<p>To maintain proper form, Gaines recommends keeping your toes pointed straight and hip-width apart (toes pointed outwards can lead to knee pain). In addition, your knees should never come in front of your toes.</p>\r\n\r\n<p>Squats can also be modified if a traditional squat is painful to do. Doing a squat against a wall can help give your back support and also promote proper form, alleviating knee pain.</p>'),
(24, 3, 'Push-Ups', 'image-2.webp', 1, '<p>“To maximize a push-up’s effectiveness and safety, get into a [high] plank position with your arms extended, and try to maintain that long, straight body position as you allow your arms to lower your body to the floor and press back up,” Robbins says. </o>\r\n\r\n<p>Push-ups are one exercise that you can slowly build your strength up with over time, so don’t be discouraged if you can only do a handful of push-ups or need to modify your push-up form at first (here’s how to progress from push-up beginner to push-up pro). Prioritize proper, safe form over everything.</p>\r\n\r\n<p>For example, if your chest and arm strength don’t yet permit pressing up off the floor, here’s a smart alternative from Robbins that can achieve similar results: “Find a sturdy, elevated surface such as a table [or counter], and do your perfect form push-up at an inclined angle,” he explains. “You’ll put your hands on that elevated surface instead of the floor.”</p>'),
(25, 3, 'Lunges', 'image-3.webp', 3, '<p>As always, to maximize lunge benefits and reduce the risk of injury, it’s important to maintain a proper form.</p>\r\n\r\n<p>“For lunges, start in a neutral position with your hands on your hips, feet directly under your hips, and toes pointed straight,” Gaines says. “Step out with your right or left leg, drop your back knee in a 90-degree angle, and explode back up to a neutral position.”</p>\r\n\r\n<p>Some tips to master the lunge technique: Keep your chest up and shoulders back throughout the process, Gaines says, and “make sure your front knee doesn’t cross over [cave inward or fall outward] or go in front of your toe.”</p>'),
(26, 3, 'Planks', 'image-4.webp', 1, '<p>To do a proper plank, Gaines says to place your elbows or hands directly under your shoulders and extend both legs back behind you with toes flexed. The weight of your body should now be fully supported by your hands (or elbows) and toes. Squeeze your glutes, engage your core, and hold this position for as long as you can, or for a set period of time, such as 30 to 60 seconds.</p>'),
(27, 3, 'Burpees', 'image-5.webp', 2, '<p>“Stand tall with your feet shoulder-width apart. Do a partial squat, then lean forward to place your hands on the ground. [Jump] your legs out behind you [into a high plank], then lower yourself to the bottom of the push-up position,” Robbins explains. “Then push your upper body back up with your arms” and jump your thighs and knees back under you, which should get you back up to the partial squat position. “Stand tall or give a little jump to finish the repetition,” Robbins adds.</p>\r\n\r\n<p>All five of these exercises can easily be done at home or at your local gym for a full-body workout. While they don’t require any equipment, you can always add resistance bands or light weights for an extra challenge. Don’t forget, you can always modify your exercises as needed.</p>'),
(35, 4, 'Frog Stretch', 'image-1.webp', 1, '<ul>\r\n<li>Start on all fours.</li>\r\n<li>Slide your knees wider than shoulder-width apart.</li>\r\n<li>Turn your toes out and rest the inner edges of your feet flat on the floor.</li>\r\n<li>Shift your hips back toward your heels.</li>\r\n<li>Move from your hands to your forearms to get a deeper stretch, if possible.</li>\r\n</ul>'),
(36, 4, 'Runners Lunge to Side Lunge', 'image-2.webp', 2, '<ul>\r\n<li>Start standing with your feet together.</li>\r\n<li>Take a big step forward with your right foot, so that you are in a staggered stance.</li>\r\n<li>Bend your right knee and drop into a runner’s lunge, keeping your left leg straight behind you with your toes on the ground, so you feel a stretch at the front of your left thigh.</li>\r\n<li>Place your hands on the floor next to your right foot.</li>\r\n<li>Hold for two counts.</li>\r\n<li>Walk your hands underneath your body toward your left foot as you straighten your right leg and bend your left knee. Your right leg should be extended directly out to your right side, foot resting on your right heel.</li>\r\n<li>Hold for two counts before walking back to the runner’s lunge.</li>\r\n<li>Repeat on the other side.</li>\r\n</ul>'),
(37, 4, 'Knee to Chest Stretch', 'image-3.webp', 2, '<ul>\r\n<li>Lie on your back with both legs extended.</li>\r\n<li>Pull your right knee into your chest, while keeping the left leg straight and your lower back pressed into the floor.</li>\r\n<li>Repeat on the other leg.</li>\r\n</ul>'),
(38, 4, 'Thread the Needle', 'image-4.webp', 1, '<ul>\r\n<li>Start in a tabletop position with your shoulders stacked directly over your wrists and hips over your knees.</li>\r\n<li>Reach your right arm underneath your left and across your body with your palm facing up.</li>\r\n<li>Bend your left elbow as you gently lean into your right side; you should feel a stretch in the back of your right shoulder.</li>\r\n<li>Hold this pose for 8–10 breaths and then repeat on the left arm.</li>\r\n</ul>'),
(39, 4, 'Heel Drop', 'image-5.webp', 1, '<ul>\r\n<li>Stand with the balls of your feet on the edge of your step.</li>\r\n<li>Drop one heel toward the floor. Bend your other leg and try not to put much weight into it.</li>\r\n<li>Repeat on the other side.</li>\r\n<li>To make this a dynamic stretch, you can slowly pedal your heels back and forth, or drop both heels toward the ground and raise them up and down.</li>\r\n</ul>'),
(40, 4, 'Piriformis Stretch', 'image-6.webp', 1, '<ul>\r\n<li>Sit on the floor with both legs extended in front of you.</li>\r\n<li>Cross your right leg over your left, and place your right foot flat on the floor.</li>\r\n<li>Place your right hand on the floor behind your body.</li>\r\n<li>Place your left hand on your right quad or your left elbow on your right knee (as shown) and press your right leg to the left as you twist your torso to the right.</li>\r\n<li>If the spinal rotation bothers your back, omit it and simply use your left hand to pull your right quad in and to the left.</li>\r\n<li>Switch sides and repeat.</li>\r\n</ul>'),
(41, 4, 'Pretzel Stretch', 'image-7.webp', 2, '<ul>\r\n<li>Lie on your left side with your head resting on your arm.</li>\r\n<li>Bend your right knee and hip up toward your chest as far as you can, and let it drop to the floor.</li>\r\n<li>Bend your left knee and grab your left foot (use a strap if you can’t reach it) with your right hand.</li>\r\n<li>Make sure your leg and torso remain in a straight line as you gently bring your top shoulder blade toward the floor.</li>\r\n<li>For more of a spinal twist, turn your head to look over your right shoulder.</li>\r\n<li>Switch sides and repeat.</li>\r\n</ul>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_excercies`
--
ALTER TABLE `workout_excercies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workout_id` (`workout_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workout_excercies`
--
ALTER TABLE `workout_excercies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `workout_excercies`
--
ALTER TABLE `workout_excercies`
  ADD CONSTRAINT `workout_excercies_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
