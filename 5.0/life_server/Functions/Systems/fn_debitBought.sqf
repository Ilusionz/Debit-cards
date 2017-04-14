/*
    File: fn_debitBought.sqf
    Author: Ilusionz

    Description:
    Updates the database upon purchasing a Debit Card.
*/
private ["_uid","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if (_uid isEqualTo "") exitWith {};

_query = format["UPDATE players SET debit='1' WHERE uid='%1'",_uid];

_thread = [_query,1] call DB_fnc_asyncCall;