-- definição das variáveis utilizadas
local precisionLand = false
local jerk = 5

function mudaJerk()

    precisionLand = precland:target_acquired() -- verifica se o presision land está engajado

    jerk = param:get('PSC_JERK_XY') --verifica o valor do jerk

    -- se o presision land estiver engajado e o valor do jerk for diferente de 2,5, ele altera o parâmetro para 2,5
    if precisionLand == true and jerk ~= 2.5 then
        param:set('PSC_JERK_XY', 2.5) -- Define para 1.5
        gcs:send_text(6, "pouso ativo: PSC_JERK_XY definido para 2.5")
    end

    -- se não estiver engajado e o valor do jerk é diferente de 5 ele altera o parametro para 5
    if precisionLand == true and jerk ~= 5 then 
        param:set('PSC_JERK_XY', 5) -- Define para 4
        gcs:send_text(6, "PSC_JERK_XY definido para 5")
    end
    
end

gcs:send_text(6, "Jerk_v1.0_alpha is running") -- menssagem de código rodando

return mudaJerk(), 1000 --roda função

