-- AI Tool: Execute Server-side Code -- resolve_ticket
-- Paste as the tool's PL/SQL source in Lab 5, Task 4.
-- :TICKET_ID is the tool parameter the agent fills from conversation context.
-- apex_ai.set_tool_result tells the agent (and the chat UI) what actually happened.
declare
  l_subject tickets.subject%type;
begin
  select subject into l_subject from tickets where id = :TICKET_ID;
  update tickets set status = 'Resolved' where id = :TICKET_ID;
  apex_ai.set_tool_result(
    p_result               => 'Ticket ' || :TICKET_ID || ' ("' || l_subject || '") is now Resolved.',
    p_notification_message => 'Ticket ' || :TICKET_ID || ' resolved.',
    p_notification_type    => 'success');
exception
  when no_data_found then
    apex_ai.set_tool_result(p_result => 'No ticket with id ' || :TICKET_ID || ' exists.');
end;
