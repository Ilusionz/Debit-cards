#include "..\..\script_macros.hpp"
/*
    File: fn_buyDebit.sqf
    Author: Ilusionz

    Description:
    Handles the purchase of Debit Cards from the ATM Menu.
*/
private ["_debitPrice","_id"];
_id = getPlayerUID player;
_debitPrice = LIFE_SETTINGS(getNumber,"debit_price");
if (life_has_debit isEqualTo true) exitWith {hint localize "STR_Debit_AlreadyOwned"};
if (_debitPrice > CASH) exitWith {hint format [localize "STR_Debit_NotEnoughCash",[_debitPrice - CASH] call life_fnc_numberText];};
CASH = CASH - _debitPrice;

if (life_HC_isActive) then {
    [_id] remoteExecCall ["HC_fnc_debitBought",HC_Life];
} else {
    [_id] remoteExecCall ["TON_fnc_debitBought",RSERV];
};

[8] call SOCK_fnc_updatePartial;
[] call life_fnc_atmMenu;
life_has_debit = true;

hint format [localize "STR_Debit_Purchased",[_debitPrice] call life_fnc_numberText];
