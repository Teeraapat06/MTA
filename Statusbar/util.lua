function isElementPlayer ( element )
    if element and isElement( element ) and getElementType( element ) == "player" then return true end return false
end

function isElementVehicle ( element )
    if element and isElement( element ) and getElementType( element ) == "vehicle" then return true end return false
end

function isElementPed ( element )
    if element and isElement( element ) and getElementType( element ) == "ped" then return true end return false
end

function getTableLength ( t )
    local n = 0
    for i,v in ipairs( t ) do
        n = n + 1
    end
    return n
end

function getCountTickTimer ( timer, count )
    return ( getTickCount( ) - count ) / ( 1000 * timer )
end

function removeColorCoding ( text )
	return type( text )=='string' and string.gsub ( text, "#%x%x%x%x%x%x", "" ) or text
end

function isAlphaNumericOnly ( str )
    return string.match(str, "^[a-zA-Z0-9]+$") ~= nil
end

vehicleType = {
    [ 409 ] = "Car",
    [ 402 ] = "Car",
    [ 410 ] = "Car",
    [ 403 ] = "Truck",
    [ 411 ] = "Car",
    [ 404 ] = "Car",
    [ 412 ] = "Car",
    [ 405 ] = "Car",
    [ 413 ] = "Car",
    [ 406 ] = "Truck",
    [ 414 ] = "Car",
    [ 407 ] = "Special Car",
    [ 415 ] = "Car",
    [ 400 ] = "Car",
    [ 408 ] = "Special Car",
    [ 416 ] = "Car",
    [ 401 ] = "Car",
    [ 500 ] = "Car",
    [ 520 ] = "Plane",
    [ 552 ] = "Car",
    [ 584 ] = "Trailers",
    [ 521 ] = "Motorbike",
    [ 405 ] = "Car",
    [ 421 ] = "Car",
    [ 437 ] = "Bus",
    [ 453 ] = "Boat",
    [ 469 ] = "Helicopter",
    [ 485 ] = "Car",
    [ 501 ] = "RC",
    [ 522 ] = "Motorbike",
    [ 554 ] = "Car",
    [ 586 ] = "Motorbike",
    [ 523 ] = "Motorbike",
    [ 406 ] = "Truck",
    [ 422 ] = "Car",
    [ 438 ] = "Car",
    [ 454 ] = "Boat",
    [ 470 ] = "Car",
    [ 486 ] = "Truck",
    [ 502 ] = "Car",
    [ 524 ] = "Truck",
    [ 556 ] = "Car",
    [ 588 ] = "Car",
    [ 525 ] = "Car",
    [ 407 ] = "Special Car",
    [ 423 ] = "Car",
    [ 439 ] = "Car",
    [ 455 ] = "Truck",
    [ 471 ] = "Motorbike",
    [ 487 ] = "Helicopter",
    [ 503 ] = "Car",
    [ 526 ] = "Car",
    [ 558 ] = "Car",
    [ 590 ] = "Train",
    [ 527 ] = "Car",
    [ 408 ] = "Truck",
    [ 424 ] = "Car",
    [ 440 ] = "Car",
    [ 456 ] = "Truck",
    [ 472 ] = "Boat",
    [ 488 ] = "Helicopter",
    [ 504 ] = "Car",
    [ 528 ] = "Car",
    [ 560 ] = "Car",
    [ 592 ] = "Plane",
    [ 529 ] = "Car",
    [ 409 ] = "Car",
    [ 425 ] = "Helicopter",
    [ 441 ] = "RC",
    [ 457 ] = "Car",
    [ 473 ] = "Boat",
    [ 489 ] = "Car",
    [ 505 ] = "Car",
    [ 530 ] = "Special Car",
    [ 562 ] = "Car",
    [ 594 ] = "RC",
    [ 531 ] = "Special Car",
    [ 410 ] = "Car",
    [ 426 ] = "Car",
    [ 442 ] = "Car",
    [ 458 ] = "Car",
    [ 474 ] = "Car",
    [ 490 ] = "Car",
    [ 506 ] = "Car",
    [ 532 ] = "Special Car",
    [ 564 ] = "RC",
    [ 596 ] = "Car",
    [ 533 ] = "Car",
    [ 411 ] = "Car",
    [ 427 ] = "Car",
    [ 443 ] = "Truck",
    [ 459 ] = "Car",
    [ 475 ] = "Car",
    [ 491 ] = "Car",
    [ 507 ] = "Car",
    [ 534 ] = "Car",
    [ 566 ] = "Car",
    [ 598 ] = "Car",
    [ 535 ] = "Car",
    [ 412 ] = "Car",
    [ 428 ] = "Car",
    [ 444 ] = "Car",
    [ 460 ] = "Plane",
    [ 476 ] = "Plane",
    [ 492 ] = "Car",
    [ 508 ] = "Car",
    [ 536 ] = "Car",
    [ 568 ] = "Car",
    [ 600 ] = "Car",
    [ 565 ] = "Car",
    [ 611 ] = "Special Car",
    [ 537 ] = "Train",
    [ 413 ] = "Car",
    [ 429 ] = "Car",
    [ 445 ] = "Car",
    [ 461 ] = "Motorbike",
    [ 477 ] = "Car",
    [ 493 ] = "Boat",
    [ 509 ] = "Bicycle",
    [ 538 ] = "Train",
    [ 570 ] = "Train",
    [ 602 ] = "Car",
    [ 577 ] = "Plane",
    [ 609 ] = "Car",
    [ 583 ] = "Car",
    [ 607 ] = "Trailers",
    [ 595 ] = "Boat",
    [ 539 ] = "Boat",
    [ 414 ] = "Car",
    [ 430 ] = "Boat",
    [ 446 ] = "Boat",
    [ 462 ] = "Motorbike",
    [ 478 ] = "Car",
    [ 494 ] = "Car",
    [ 510 ] = "Bicycle",
    [ 540 ] = "Car",
    [ 572 ] = "RC",
    [ 604 ] = "Car",
    [ 605 ] = "Car",
    [ 603 ] = "Car",
    [ 601 ] = "Special Car",
    [ 599 ] = "Car",
    [ 597 ] = "Car",
    [ 541 ] = "Car",
    [ 415 ] = "Car",
    [ 431 ] = "Bus",
    [ 447 ] = "Helicopter",
    [ 463 ] = "Motorbike",
    [ 479 ] = "Car",
    [ 495 ] = "Car",
    [ 511 ] = "Plane",
    [ 542 ] = "Car",
    [ 574 ] = "Car",
    [ 606 ] = "Trailers",
    [ 593 ] = "Plane",
    [ 591 ] = "Trailers",
    [ 589 ] = "Car",
    [ 587 ] = "Car",
    [ 585 ] = "Car",
    [ 400 ] = "Car",
    [ 416 ] = "Car",
    [ 432 ] = "Special Car",
    [ 448 ] = "Motorbike",
    [ 464 ] = "RC",
    [ 480 ] = "Car",
    [ 496 ] = "Car",
    [ 512 ] = "Plane",
    [ 544 ] = "Special Car",
    [ 576 ] = "Car",
    [ 608 ] = "Special Car",
    [ 555 ] = "Car",
    [ 581 ] = "Motorbike",
    [ 567 ] = "Car",
    [ 579 ] = "Car",
    [ 513 ] = "Plane",
    [ 401 ] = "Car",
    [ 417 ] = "Helicopter",
    [ 433 ] = "Car",
    [ 449 ] = "Train",
    [ 465 ] = "RC",
    [ 481 ] = "Bicycle",
    [ 497 ] = "Helicopter",
    [ 514 ] = "Truck",
    [ 546 ] = "Car",
    [ 578 ] = "Truck",
    [ 610 ] = "Special Car",
    [ 575 ] = "Car",
    [ 573 ] = "Car",
    [ 571 ] = "RC",
    [ 569 ] = "Train",
    [ 515 ] = "Truck",
    [ 402 ] = "Car",
    [ 418 ] = "Car",
    [ 434 ] = "Car",
    [ 450 ] = "Trailers",
    [ 466 ] = "Car",
    [ 482 ] = "Car",
    [ 498 ] = "Car",
    [ 516 ] = "Car",
    [ 548 ] = "Helicopter",
    [ 580 ] = "Car",
    [ 563 ] = "Helicopter",
    [ 561 ] = "Car",
    [ 559 ] = "Car",
    [ 557 ] = "Car",
    [ 517 ] = "Car",
    [ 403 ] = "Truck",
    [ 419 ] = "Car",
    [ 435 ] = "Trailers",
    [ 451 ] = "Car",
    [ 467 ] = "Car",
    [ 483 ] = "Car",
    [ 499 ] = "Car",
    [ 518 ] = "Car",
    [ 550 ] = "Car",
    [ 582 ] = "Car",
    [ 553 ] = "Helicopter",
    [ 551 ] = "Car",
    [ 549 ] = "Car",
    [ 547 ] = "Car",
    [ 545 ] = "Car",
    [ 519 ] = "Plane",
    [ 404 ] = "Car",
    [ 420 ] = "Car",
    [ 436 ] = "Car",
    [ 452 ] = "Boat",
    [ 468 ] = "Motorbike",
    [ 484 ] = "Boat",
    [ 543 ] = "Car",
}


function getVehicleHandlingProperty ( element, property )
    if isElement ( element ) and getElementType ( element ) == "vehicle" and type ( property ) == "string" then -- Make sure there's a valid vehicle and a property string
        local handlingTable = getVehicleHandling ( element ) -- Get the handling as table and save as handlingTable
        local value = handlingTable[property] -- Get the value from the table
        
        if value then -- If there's a value (valid property)
            return value -- Return it
        end
    end
    
    return false -- Not an element, not a vehicle or no valid property string. Return failure
end

function getVehicleRPM (vehicle) 
    if (vehicle) then   
		local velocityVec = Vector3(getElementVelocity(vehicle))
		local velocity = velocityVec.length * 180
					
        if (isVehicleOnGround(vehicle)) then
            if (getVehicleEngineState(vehicle) == true) then
                if(getVehicleCurrentGear(vehicle) > 0) then
                    vehicleRPM = math.floor(((velocity/getVehicleCurrentGear(vehicle))*100) + 0.5)
                    if (vehicleRPM < 650) then
                        vehicleRPM = math.random(650, 750)
                    elseif (vehicleRPM >= 8000) then
                        vehicleRPM = 8000
                    end
                else
                    vehicleRPM = math.floor(((velocity/1)*220) + 0.5)
                    if (vehicleRPM < 650) then
                        vehicleRPM = math.random(650, 750)
                    elseif (vehicleRPM >= 8000) then
                        vehicleRPM = 8000
                    end
                end
            else
                vehicleRPM = 0
            end
        else   
            if (getVehicleEngineState(vehicle) == true) then
                vehicleRPM = vehicleRPM - 150
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 8000) then
                    vehicleRPM = 8000
                end
            else
                vehicleRPM = 0
            end
        end
        return tonumber(vehicleRPM)
    else
        return 0
    end
end

function getVehicleRPM( vehicle )
    local vehicleRPM = 0
    if (vehicle) then  
        if (getVehicleEngineState(vehicle) == true) then
            if getVehicleCurrentGear(vehicle) > 0 then             
                vehicleRPM = math.floor(((getElementSpeed(vehicle, 1)/getVehicleCurrentGear(vehicle))*180) + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(550, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            else
                vehicleRPM = math.floor((getElementSpeed(vehicle, 1)*180) + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end 
            end
        else
            vehicleRPM = 0
        end
        return tonumber(vehicleRPM)
    else
        return 0
    end
end

function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end

function getTypeVehicle ( modelID )
    if vehicleType[ modelID ] then
        return vehicleType[ modelID ]
    end
    return false
end

function getVehicleModeByTypeName ( typeName )
    local t = {}
    for k,v in pairs( vehicleType ) do
        if v == typeName then table.insert( t, k ) end
    end
    return t
end