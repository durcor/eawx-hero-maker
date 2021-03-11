#!/bin/sh

echo "What mod is this hero for?"
echo "Available Options: Fall of the Republic (fotr), Thrawns Revenge (tr)?"
while [ "$mod" != "fotr" ] && [ "$mod" != "tr" ]; do read -r mod; done

echo "What faction is this hero for?"
if [ "$mod" = "tr" ]; then
	echo "Available Options:
	- New Republic (nr)
	- Imperial Remnant (ir)
	- Empire of the Hand (eoth)
	- Pentastar Alignment (pa)
	- Greater Maldrood (gm)
	- Zsinj's Empire (ze)
	- Eriadu Authority (ea)
	- Corporate Sector Authority (csa)"
	while [ "$faction" != "nr" ] &&
		[ "$faction" != "ir" ] &&
		[ "$faction" != "eoth" ] &&
		[ "$faction" != "pa" ] &&
		[ "$faction" != "gm" ] &&
		[ "$faction" != "ze" ] &&
		[ "$faction" != "ea" ] &&
		[ "$faction" != "csa" ]; do read -r faction; done
else
	echo "Available Options:
	- Galactic Republic (gr)
	- Confederacy of Independent Systems (cis)"
	while [ "$faction" != "gr" ] && [ "$faction" != "cis" ]; do
		read -r faction
	done
fi

# Aesthetics
echo "What is your gender?"
echo "Available Options: male (m), female (f)?"
while [ "$gender" != "m" ] && [ "$gender" != "f" ]; do read -r gender; done

echo "What is your species?
Available Options:"
if [ "$mod" = "tr" ]; then
	if [ "$faction" = "nr" ]; then
		echo "
		- Human (h)
		- Mon Calamari (mc)
		- Duros (du)
		- Rodian (r)
		- Twi'lek (t)
		- Sullustan (s)
		- Quarren (q)
		- Zabrack (z)
		- Bothan (b)"
		while [ "$species" != "h" ] &&
			[ "$species" != "mc" ] &&
			[ "$species" != "du" ] &&
			[ "$species" != "r" ] &&
			[ "$species" != "t" ] &&
			[ "$species" != "s" ] &&
			[ "$species" != "q" ] &&
			[ "$species" != "z" ] &&
			[ "$species" != "b" ]; do read -r species; done
	elif [ "$faction" = "ir" ]; then
		echo "
		- Human (h)
		- Chiss (c)
		- Noghri (n)"
		while [ "$species" != "h" ] &&
			[ "$species" != "c" ] &&
			[ "$species" != "n" ]; do read -r species; done
	elif [ "$faction" != "eoth" ]; then
		echo "
		- Human (h)
		- Chiss (c)"
		while [ "$species" != "h" ] &&
			[ "$species" != "c" ]; do read -r species; done
	elif [ "$faction" != "pa" ]; then
		echo "
		- Human (h)
		- Muun (m)"
		while [ "$species" != "h" ] &&
			[ "$species" != "m" ]; do read -r species; done
	elif [ "$faction" != "gm" ]; then
		echo "- Human (h)"
		while [ "$species" != "h" ]; do read -r species; done
	elif [ "$faction" != "ze" ]; then
		echo "- Human (h)
		- Dathomirian (da)"
		while [ "$species" != "h" ] &&
			[ "$species" != "da" ]; do read -r species; done
	elif [ "$faction" != "ea" ]; then
		echo "- Human (h)"
		while [ "$species" != "h" ]; do read -r species; done
	elif [ "$faction" != "csa" ]; then
		echo "- Human (h)"
		while [ "$species" != "h" ]; do read -r species; done
	fi
elif [ "$mod" = "fotr" ]; then
	if [ "$faction" = "gr" ]; then
		echo "- Human (h),
		- Mon Calamari (mc)
		- Duros (du)
		- Rodian (r)
		- Twi'lek (t)"
		while [ "$species" != "h" ] &&
			[ "$species" != "mc" ] &&
			[ "$species" != "du" ] &&
			[ "$species" != "r" ] &&
			[ "$species" != "t" ] &&
			[ "$species" != "q" ] &&
			[ "$species" != "b" ]; do read -r species; done
	elif [ "$faction" = "cis" ]; then
		echo "
		- Human (h)
		- Nemoidian (n)
		- Geonosian (g)
		- Muun (m)
		- Quarren (q)
		- Sullustan (s)"
		while [ "$species" != "h" ] &&
			[ "$species" != "c" ] &&
			[ "$species" != "n" ]; do read -r species; done
	fi
fi
echo "What is your name?"
read -r name
echo "What is your ship's name?"
read -r ship_name

# Abilities
echo "Are you force-sensitive? (y/n)"
echo "Ability to use force powers in ground battles."
# TODO: Correlate force powers with ship type
# Assault: Shockwave
# Defensive: Resistance
# Support: Heal
while [ "$force_sensitive" != "y" ] &&
	[ "$force_sensitive" != "n" ]; do read -r force_sensitive; done
echo "Are you stealthy?"
echo "Ability to go to enemy planets undetected."
echo "Warning: Restricts ship type to Fighter."
while [ "$stealthy" != "y" ] &&
	[ "$stealthy" != "n" ]; do read -r stealthy; done
# What ships to progress through
if [ "$stealthy" = "n" ]; then
	echo "What type of starships do you command?"
	echo "Available Options:
	- Assault (a): Strong weapons, weak hull/shield
	- Defense (d): Strong hull/shield, weak weapons
	- Support (s): Fleet carrier
	- Fighter Squadron (fs): Squad of Fighters
	- Fighter (f): Single Fighter/freighter"
	while [ "$type" != "a" ] &&
		[ "$type" != "d" ] &&
		[ "$type" != "s" ] &&
		[ "$type" != "fs" ] &&
		[ "$type" != "f" ]; do read -r type; done
else
	type="f"
fi

if [ "$type" = "f" ]; then
	# TODO: Add support for specifying fighter to use
	true
fi

# Command tier levels inverse of current era (Start at 5, end at 1)
# NR:
# 	Assault:
# 		1: MC80b
# 		2:
# 		3:
# 		4:
# 		5: Viscount
# 	Defense:
# 		1: MC80
# 		2:
# 		3:
# 		4:
# 		5:
# 	Support:
# 		1: Quasar
# 		2: Lucrehulk
# 		3-4: Endurance
# 		5: Mediator
# 	Fighter:
# 		1-2: X-Wing Squad
# 		3+: E-Wing Squad
