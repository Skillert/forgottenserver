local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function onGetFormulaValues(cid, level, attack, factor)
	local distanceSkill = Player(cid):getEffectiveSkillLevel(SKILL_DISTANCE)
	local skillDouble, levelTotal = distanceSkill * 2, level / 5
	return -(((skillDouble + attack / 2500) * 0.5) + (levelTotal) + 7), -(((skillDouble + attack / 1875) * 0.75) + (levelTotal) + 13)
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
