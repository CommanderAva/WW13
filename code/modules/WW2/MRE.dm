//Food items that are eaten normally and don't leave anything behind.
/obj/item/weapon/reagent_containers/food/snacks/MRE
	name = "MRE"
	desc = "horrible food"
	nutriment_desc = list("horrible food" = 1)
	nutriment_amt = 5
	var/open = FALSE
	var/opens = TRUE
	var/base_state = ""
	trash = null

/obj/item/weapon/reagent_containers/food/snacks/MRE/attack(mob/M as mob, mob/user as mob, def_zone)
	if (!open && opens && M == user)
		user << "<span class = 'warning'>Open it first.</span>"
		return FALSE
	return ..(M, user, def_zone)

/obj/item/weapon/reagent_containers/food/snacks/MRE/attack_self(var/mob/living/carbon/human/H)
	if (!istype(H))
		return
	if (!open && opens)
		playsound(get_turf(src), 'sound/effects/rip_pack.ogg', 100)
		visible_message("<span class = 'notice'>[H] opens [src].</span>")
		icon_state = "[base_state]_open"
		open = TRUE
	return

// generic MRE

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic
	base_state = "mre_food"
	icon_state = "mre_food"
	name = "Generic MRE"
	opens = FALSE
	trash = /obj/item/weapon/generic_MRE_trash

/obj/item/weapon/generic_MRE_trash
	icon = 'icons/obj/food.dmi'
	icon_state = "mre_food_trash"
	name = "Package litter"
	desc = "Empty packaging. You can smell some salty pork in there"
	w_class = 1

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/german
	name = "Brot mit Trockenschweinfleisch"
	desc = "A package of bread and salted pork sticks. Better than nothing."
	icon_state = "german_food"
	nutriment_desc = list("salted pork" = 1, "bread" = 1)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/soviet
	name = "Canned buckwheat"
	desc = "A can of bukwheat. Just enough to keep going to Reichstag."
	nutriment_desc = list("buckwheat" = 1)
	icon_state = "buckwheat"
	trash = /obj/item/weapon/soviet_can_empty

/obj/item/weapon/soviet_can_empty
	icon = 'icons/obj/food.dmi'
	icon_state = "buckwheat_empty"
	name = "Empty can"
	desc = "Empty food can. It is clean as a new, the one who ate it must have been very hungry."
	w_class = 1

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/american
	name = "Canned Meat"
	desc = "Canned meat and vegetables in a aluminium can. Yummy!"
	nutriment_desc = list("canned meat" = 1, "canned vegetables" = 1)
	icon_state = "stewcan"
	trash = /obj/item/weapon/american_can_empty

/obj/item/weapon/american_can_empty
	icon = 'icons/obj/food.dmi'
	icon_state = "stew_empty"
	name = "Empty can"
	desc = "Empty food can. You can smell that there was meat in it."
	w_class = 1

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/italian
	name = "Canned spaghett"
	desc = "Canned spaghetti. Mama mia!"
	nutriment_desc = list("spaghett" = 1)
	icon_state = "spaghetti"
	trash = /obj/item/weapon/italian_can_empty

/obj/item/weapon/italian_can_empty
	icon = 'icons/obj/food.dmi'
	icon_state = "spaghetti_empty"
	name = "Empty can"
	desc = "Empty food can. You can smell that there was spaghetti in it."
	w_class = 1

/obj/item/weapon/jap_food_trash
	icon = 'icons/obj/food.dmi'
	icon_state = "jap_food_trash"
	name = "Empty ration box"
	desc = "Aluminium box used to store food. You can see a few of rice seeds in it."
	w_class = 1

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/japanese
	name = "Rice ration"
	icon_state = "jap_food"
	desc = "Japanese soldier's ration of boiled rice, ready too be eaten. Its already cold though."
	nutriment_desc = list("rice" = 1)
	trash = /obj/item/weapon/jap_food_trash

/obj/item/weapon/jap_food_trash
	icon = 'icons/obj/food.dmi'
	icon_state = "jap_food_trash"
	name = "Empty ration box"
	desc = "Aluminium box used to store food. You can see a few of rice seeds in it."
	w_class = 1

// scho ka kola

/obj/item/weapon/reagent_containers/food/snacks/MRE/schokakola
	base_state = "schokakola"
	icon_state = "schokakola"
	name = "Scho-Ka-Kola"
	desc = "A delicious chocolate treat with lots of caffeine."
	trash = /obj/item/weapon/schokakola_trash
	nutriment_desc = list("chocolate" = 1, "caffeine" = 1)

/obj/item/weapon/reagent_containers/food/snacks/MRE/schokakola/New()
	..()
	reagents.reagent_list.Cut()
	reagents.add_reagent("nutriment", 3)
	reagents.add_reagent("sugar", 3)
	reagents.add_reagent("coco", 3)
	reagents.add_reagent("hyperzine", 3)

/obj/item/weapon/schokakola_trash
	icon = 'icons/obj/food.dmi'
	icon_state = "schokakola_trash"
	name = "Schokakola trash"
	desc = "The remains of a delicious Scho-Ka-Kola."
	w_class = 1