/*
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef MANGOS_INSTANCE_DATA_H
#define MANGOS_INSTANCE_DATA_H

#include "Common.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"

class Map;
class Unit;
class Player;
class GameObject;
class Creature;
class WorldObject;

enum InstanceConditionIDs                                   // Suggested values used with CONDITION_INSTANCE_SCRIPT for some generic uses
{
    // for hard-mode loot (0 normal; 1,2... hard,harder... mode)
    INSTANCE_CONDITION_ID_NORMAL_MODE       = 0,
    INSTANCE_CONDITION_ID_HARD_MODE         = 1,
    INSTANCE_CONDITION_ID_HARD_MODE_2       = 2,
    INSTANCE_CONDITION_ID_HARD_MODE_3       = 3,
    INSTANCE_CONDITION_ID_HARD_MODE_4       = 4,

    // to check for which team the instance is doing scripts
    INSTANCE_CONDITION_ID_TEAM_HORDE        = 67,
    INSTANCE_CONDITION_ID_TEAM_ALLIANCE     = 469,

    // to check water event in SSC
    INSTANCE_CONDITION_ID_LURKER            = 21217,
    INSTANCE_CONDITION_ID_SCALDING_WATER    = 37284,
    // to check vehicles in Ulduar
    INSTANCE_CONDITION_ID_ULDUAR            = 33113,
};

class MANGOS_DLL_SPEC InstanceData
{
    public:

        explicit InstanceData(Map* map) : instance(map) {}
        virtual ~InstanceData() {}

        Map* instance;

        // On creation, NOT load.
        virtual void Initialize() {}

        // On load
        virtual void Load(const char* /*data*/) {}

        // When save is needed, this function generates the data
        virtual const char* Save() const { return ""; }

        void SaveToDB();

        // Called every map update
        virtual void Update(uint32 /*diff*/) {}

        // Used by the map's CanEnter function.
        // This is to prevent players from entering during boss encounters.
        virtual bool IsEncounterInProgress() const { return false; };

        // Called when a player successfully enters the instance (after really added to map)
        virtual void OnPlayerEnter(Player*) {}

        // Called when a player dies inside instance
        virtual void OnPlayerDeath(Player*) {}

        // Called when a player leaves the instance (before really removed from map (or possibly world))
        virtual void OnPlayerLeave(Player*) {}

        // Called when a player successfully enters the other area
        virtual void OnPlayerEnterArea(Player*, uint32 /*uiNewAreaId*/,  uint32 /*uiOldAreaId*/) {}

        // Called when a player successfully enters the other zone
        virtual void OnPlayerEnterZone(Player*, uint32 /*uiNewZoneId*/, uint32 /*uiNewAreaId*/) {}

        // Called when a player leave zone
        virtual void OnPlayerLeaveZone(Player*, uint32 /*uiOldZoneId*/) {}

        // Called when a player drops a flag in outdoor pvp
        virtual void OnPlayerDroppedFlag(Player*, uint32 /* uiSpellId*/) {}

        // Called when a gameobject is created
        virtual void OnObjectCreate(GameObject*) {}

        // called on creature creation
        virtual void OnCreatureCreate(Creature* /*creature*/) {}

        // called on creature enter combat
        virtual void OnCreatureEnterCombat(Creature* /*creature*/) {}

        // called on creature evade
        virtual void OnCreatureEvade(Creature* /*creature*/) {}

        // called on creature death
        virtual void OnCreatureDeath(Creature* /*creature*/) {}

        // called on creature despawn
        virtual void OnCreatureDespawn(Creature* /*creature*/) {}

        // All-purpose data storage 64 bit
        virtual uint64 GetData64(uint32 /*Data*/) const { return 0; }
        virtual void SetData64(uint32 /*Data*/, uint64 /*Value*/) { }

        // Guid data storage (wrapper for set/get from uint64 storage
        ObjectGuid GetGuid(uint32 dataIdx) const { return ObjectGuid(GetData64(dataIdx)); }
        void SetGuid(uint32 dataIdx, ObjectGuid value) { SetData64(dataIdx, value.GetRawValue()); }

        // All-purpose data storage 32 bit
        virtual uint32 GetData(uint32 /*Type*/) const { return 0; }
        virtual void SetData(uint32 /*Type*/, uint32 /*Data*/) {}

        // Achievement criteria additional requirements check
        // NOTE: not use this if same can be checked existing requirement types from AchievementCriteriaRequirementType
        virtual bool CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* source, Unit const* target = NULL, uint32 miscvalue1 = 0) const;

        // Condition criteria additional requirements check
        // This is used for such things are heroic loot
        virtual bool CheckConditionCriteriaMeet(Player const* source, uint32 instance_condition_id, WorldObject const* conditionSource, ConditionSource conditionSourceType) const;

        // Set and send special encounter frame state (currently - from scripts)
        virtual void UpdateSpecialEncounterState(EncounterFrameCommand command, ObjectGuid linkedGuid, uint8 data1 = 0, uint8 data2 = 0);
        virtual void SendSpecialEncounterState(ObjectGuid linkedGuid);

};
#endif
