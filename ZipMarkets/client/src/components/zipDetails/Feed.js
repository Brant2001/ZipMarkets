import React, { useContext, useState } from "react"
import { MessageContext } from "../../providers/MessageProvider"
import { Input, Button, Collapse } from "reactstrap";
import "./Feed.css"

export default function Feed({oneZip, refreshZip}) {
    const {addMessage, deleteMessage} = useContext(MessageContext)
    const [content, setContent] = useState();
    const [categoryId, setCategoryId] = useState(3)
    const [isOpen, setIsOpen] = useState(false);
    const toggle = () => setIsOpen(!isOpen);

    const currentUser = JSON.parse(sessionStorage.getItem("user"));

    const saveMessage = () => {
        const newMessage = {
            zipCodeId: oneZip.id,
            categoryId,
            userId: currentUser.id,
            content
        }
        addMessage(newMessage)
    }

    const removeMessage = (id) => {
        deleteMessage(id)
    }
    return (
        <>
        <Button outline color="info" onClick={toggle} style={{ marginBottom: '1rem' }}>Comments</Button>
        <Collapse isOpen={isOpen}>
        <div className="messages-container">
        {
            oneZip.messageList.map(message => {
                return (
                    <div className="message-container">
                        <div className="message-category">{message.category.name}</div>
                        <div className="message-content">{message.content}</div>
                        <Button onClick={(e) => {
                            e.preventDefault()
                            removeMessage(message.id)
                            refreshZip()
                        }}>X</Button>
                    </div>
                )
            })
        }
        </div>
        <div className="messageSubmit-container">
            <Input
                type="select"
                onChange ={(e) => setCategoryId(parseInt(e.target.value))}
                className="category-input"
            >
                <option value="3">Category...</option>
                <option value="1">Buying</option>
                <option value="2">Selling</option>
                <option value="3">Other</option>
            </Input>
            <Input
                type="text"
                id="newMessage"
                placeholder="Enter comment here"
                className="content-input"
                onChange={(e) => setContent(e.target.value)}
            >
            </Input>
            <Button
                type="submit"
                size="md"
                onClick={(e) => {
                    e.preventDefault()
                    debugger
                    saveMessage()
                    refreshZip()
                }}
            >
            Send
            </Button>
        </div>
        </Collapse>
        </>
    )
}