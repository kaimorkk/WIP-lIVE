tableextension 50142 "Customer Posting Group" extends "Customer Posting Group"
{
    fields
    {
        field(50000; "Utilization"; Option)
        {
            OptionMembers = " ","Safari Imprest","Standing Imprest","Special Imprest","Staff Claim";
        }
    }
    procedure GetPostinGroup(Options: Option " ","Safari Imprest","Standing Imprest","Special Imprest","Staff Claim"): Code[30]
    var
        CSP: Record "Customer Posting Group";
    begin
        CSP.Reset();
        CSP.SetRange(Utilization, Options);
        if CSP.FindFirst() then
            exit(CSP.Code);
    end;
}