--[[
	Purpose: Sets up a translations that are to be used in the script. Useful for communities
	that do not use English as their primary language.
	
	If you edit the translations, make sure to keep a backup if you need it in English again.
--]]

if (!nut.lang) then
	include("libs/sh_lang.lua")
end

-- Self explanatory, but these are basically translations. If you see %s, they're variables
-- that are replaced in the script with something else.
nut.lang.Add("schema_author", "Created by %s.")
nut.lang.Add("create", "Create")
nut.lang.Add("create_tip", "Create a new character to play as.")
nut.lang.Add("load", "Load")
nut.lang.Add("load_tip", "Load a previously created character.")
nut.lang.Add("cancel", "Cancel")
nut.lang.Add("cancel_tip", "Return to the game.")
nut.lang.Add("leave", "Leave")
nut.lang.Add("leave_tip", "Leave the current server.")
nut.lang.Add("return", "Return")
nut.lang.Add("choose", "Choose")
nut.lang.Add("choose_tip", "Choose the current option.")
nut.lang.Add("delete", "Delete")
nut.lang.Add("delete_tip", "Delete the current option.")
nut.lang.Add("delete_question", "Are you sure you want to delete %s?")
nut.lang.Add("no", "No")
nut.lang.Add("yes", "Yes")
nut.lang.Add("male", "Male")
nut.lang.Add("female", "Female")
nut.lang.Add("gender_status", "I am a ")
nut.lang.Add("name_status", "My name is ")
nut.lang.Add("set_as", "Set As")
nut.lang.Add("faction_status", "Member of the ")
nut.lang.Add("desc_status", "I am described as ")
nut.lang.Add("desc_char_req", "Your description needs to have at least %s character(s).")
nut.lang.Add("char_validating", "Validating character with server...")
nut.lang.Add("char_info", "Name: %s\nDescription: %s\nFaction: %s")
nut.lang.Add("inventory", "Inventory")
nut.lang.Add("characters", "Characters")
nut.lang.Add("item_info", "Name: %s\nDescription: %s\nData: ")
nut.lang.Add("none", "None")
nut.lang.Add("no_desc", "No description available.")
nut.lang.Add("misc", "Miscellaneous")
nut.lang.Add("dead_talk_error", "You cannot talk while dead.")
nut.lang.Add("nochar_talk_error", "You need have a character first.")
nut.lang.Add("help", "Help")
nut.lang.Add("no_perm", "You are not allowed to do that, %s.")
nut.lang.Add("no_ply", "You provided an invalid player.")
nut.lang.Add("missing_arg", "You are missing argument #%s.")
nut.lang.Add("already_whitelisted", "This player already has this whitelist.")
nut.lang.Add("not_whitelisted", "This player does not have this whitelist.")
nut.lang.Add("invalid_faction", "You provided an invalid faction.")
nut.lang.Add("blacklisted", "%s has blacklisted %s from the %s faction.")
nut.lang.Add("whitelisted", "%s has whitelisted %s to the %s faction.")
nut.lang.Add("flags_give", "%s has given '%s' flag(s) to %s.")
nut.lang.Add("flags_take", "%s has taken '%s' flag(s) from %s.")
nut.lang.Add("no_invspace", "This item can not fit in your inventory.")