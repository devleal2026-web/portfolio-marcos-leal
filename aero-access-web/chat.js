import { supabase }
from "./supabase.js";

const user =
JSON.parse(
localStorage.getItem("user")
)
||
JSON.parse(
localStorage.getItem("passenger")
);

const roomId =
localStorage.getItem(
"chatRoomId"
);

loadMessages();

subscribeMessages();

window.sendMessage =
async () => {

    const input =
    document.getElementById(
    "messageInput"
    );

    const text =
    input.value.trim();

    if(!text) return;

    await supabase
    .from("chat_messages")
    .insert([{

        room_id: roomId,

        sender_type:
        user.role || "passenger",

        sender_name:
        user.name,

        message:
        text

    }]);

    input.value = "";

};

async function loadMessages(){

    const {
        data
    } =
    await supabase
    .from("chat_messages")
    .select("*")
    .eq("room_id",roomId)
    .order(
        "created_at",
        {
            ascending:true
        }
    );

    render(data);

}

function render(messages){

    const container =
    document.getElementById(
    "messages"
    );

    container.innerHTML="";

    messages.forEach(msg=>{

        const div =
        document.createElement(
        "div"
        );

        const mine =
        msg.sender_name ===
        user.name;

        div.className =
        `message ${
        mine
        ? "mine"
        : "other"
        }`;

        div.innerHTML=`

        <strong>

        ${msg.sender_name}

        </strong>

        <br>

        ${msg.message}

        `;

        container.appendChild(div);

    });

    container.scrollTop =
    container.scrollHeight;

}

function subscribeMessages(){

    supabase

    .channel(
    "chat-room"
    )

    .on(
        "postgres_changes",
        {
            event:"INSERT",
            schema:"public",
            table:"chat_messages"
        },

        async payload=>{

            if(
                payload.new.room_id
                !==
                roomId
            ) return;

            loadMessages();

        }
    )

    .subscribe();

}