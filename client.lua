ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local wuzyciu = true

RegisterNetEvent('tabletki:start')
AddEventHandler('tabletki:start', function()
    
    local ped = GetPlayerPed(-1)

    local hp = GetEntityHealth(ped)

    if hp < 200 then

        if wuzyciu then

            wuzyciu = false

            local inVeh = IsPedInAnyVehicle(ped, false)

            TriggerServerEvent('tabletki:use')

            if not inVeh then

                RequestAnimDict("mp_suicide")

                while not HasAnimDictLoaded("mp_suicide") do

                    RequestAnimDict("mp_suicide")

                    Citizen.Wait(10)

                end

                TaskPlayAnim(ped, "mp_suicide", "pill", 2.0, 2.0, -1, 51, 0, false, false, false)

                Citizen.Wait(3000)

                ClearPedTasks(ped)


            end

            ESX.ShowNotification('Tabletka niedługo zacznie działać...')

            Citizen.Wait(10000)

            ESX.ShowNotification('Tabletka zaczyna działać...')

            if hp <= 190 then

                SetEntityHealth(ped, hp + 10)

                local healTime = 120000

                Citizen.Wait(healTime)

                SetEntityHealth(ped, 200)

                ESX.ShowNotification('Czujesz się już lepiej')

            else
                SetEntityHealth(ped, 200)

            end

            local time = 600000

            Citizen.Wait(time)

            wuzyciu = true

        else

            ESX.ShowNotification("Nie możesz teraz użyć kolejnej tabletki!")

        end

    else

        ESX.ShowNotification('Nie potrzebujesz użycia tabletki przeciwbólowej!')

        wuzyciu = true

    end
end)