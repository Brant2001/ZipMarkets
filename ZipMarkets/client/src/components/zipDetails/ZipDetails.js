import React, { useContext, useState, useEffect } from "react"
import { ZipContext } from "../../providers/ZipProvider"
import { useParams } from "react-router-dom"
import HPIGraph from "./HPIGraph"
import "./ZipDetails.css"
import ZVHIGraph from "./ZVHIGraph"
import COLTable from "./COLTable"
import {ReactComponent as Pinned} from "../../images/Pinned.svg"
import NotPinned from "../../images/NotPinned.png"
import { PinnedMarketContext } from "../../providers/PinnedMarketProvider"
import { UserContext } from "../../providers/UserProvider"

export default function ZipDetails() {
    const {getZipById} = useContext(ZipContext)
    const {addPinnedMarket, deletePinnedMarket} = useContext(PinnedMarketContext)
    const {getUserById} = useContext(UserContext)
    const [currentUser, setCurrentUser] = useState({
        userPinnedMarkets: []
    })
    const [oneZip, setOneZip] = useState({
        hpiList: [],
        zvhiList: [],
        state: []
    })
    const id = useParams()
    const parsedId = parseInt(id.id)
    const [isPinned, setIsPinned] = useState(false)
    const currentUserSesh = JSON.parse(sessionStorage.getItem("user"));

    useEffect(() => {
        getUserById(currentUserSesh.id).then(setCurrentUser)
    },[])

    useEffect(() => {
        getUserById(currentUserSesh.id).then(setCurrentUser)
    },[isPinned])
    
    useEffect(() => {
        getZipById(parsedId).then(setOneZip)
    },[])
    
    useEffect(() => {
        if(currentUser.userPinnedMarkets.find(pm => pm.zipCodeId === oneZip.id))
        {
            setIsPinned(true)
        }
    },[oneZip])
    
    const handlePin = () => {
        setIsPinned(!isPinned)
        if(isPinned) {
            const foundPM = currentUser.userPinnedMarkets.find(pm => pm.zipCodeId === oneZip.id)
            deletePinnedMarket(foundPM.id)
        }
        else {
            const newPM = {
                UserId: currentUser.id,
                ZipCodeId: oneZip.id
            }
            addPinnedMarket(newPM)
        }
    }

    const pinnedStatus = () => {
        if (isPinned) {
            return (
                <Pinned onClick={handlePin} style={{width: '34px', height: '57px'}}/>
            )
        }
        else {
            return <img onClick={handlePin} width= '34px' height= '57px' src={NotPinned} alt="not pinned"  />
        }
    }
    
    return (
        <>
        <div className="title-Container">
            <h1>{oneZip.zipCode} {oneZip.city}, {oneZip.state.stateAbbr}</h1>
            {pinnedStatus()}
        </div>
        <div className="graphs-container">
            <div className ="oneGraph">
            <HPIGraph oneZip={oneZip} />
            </div>
            <div className="oneGraph">
            <ZVHIGraph oneZip={oneZip} />
            </div>
        </div>
        <div className="COL-container">
            <COLTable oneZip={oneZip} />
        </div>
        <div className="feed-container">
            Live Feed
        </div>
        </>
    )
}