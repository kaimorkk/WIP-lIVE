codeunit 50027 "Leave Approval Management"
{
    trigger OnRun()
    begin
        RestoreApprovals();
    end;

    procedure RelieveApprovals(LeaveApp: Record "HR Leave Application")
    var
        UserSetup2: Record "User Setup";
        UserSetup: Record "User Setup";
        RelievalBuffer: Record "Leave Relieval Buffer";
        EntryNo: Integer;
    begin
        LeaveApp.TestField("Requester ID");
        RelievalBuffer.Reset();
        if RelievalBuffer.FindLast() then
            EntryNo := RelievalBuffer."Entry No" + 1;
        UserSetup.Reset();
        UserSetup.SetRange("Approver ID", LeaveApp."Requester ID");
        //UserSetup.SetFilter("Approver ID", '<>%1', '');
        if UserSetup.FindSet(true) then begin
            repeat
                UserSetup2.Reset();
                UserSetup2.SetRange("Employee No.", LeaveApp.Reliever);
                if UserSetup2.FindFirst() then begin
                    //Nothing to see here
                end else
                    Error(StrSubstNo('The selected Reliever %1 has not been set up on the User Setup. Please contact your system administrator.', LeaveApp.Reliever));
                RelievalBuffer.Init();
                RelievalBuffer."Entry No" := EntryNo;
                RelievalBuffer."User ID" := LeaveApp."Requester ID";
                RelievalBuffer."Application No" := LeaveApp."Application Code";
                RelievalBuffer.Approvee := UserSetup."User ID";
                if not RelievalBuffer.Insert(true) then RelievalBuffer.Modify();
                UserSetup."Approver ID" := UserSetup2."User ID";
                UserSetup.Modify();
                EntryNo += 1;
            until UserSetup.Next() = 0;
        end;
    end;

    procedure RestoreApprovals()
    var
        LeaveApp: Record "HR Leave Application";
        UserSetup, UserSetup2 : Record "User Setup";
        RelievalBuffer: Record "Leave Relieval Buffer";
    begin
        LeaveApp.Reset();
        LeaveApp.SetRange(Status, LeaveApp.Status::Released);
        LeaveApp.SetRange(Posted, true);
        LeaveApp.SetRange("Return Date", Today);
        if LeaveApp.FindSet() then
            repeat
                RelievalBuffer.Reset();
                RelievalBuffer.SetRange("Application No", LeaveApp."Application Code");
                if RelievalBuffer.FindSet() then
                    repeat
                        if UserSetup.Get(RelievalBuffer.Approvee) then begin
                            UserSetup."Approver ID" := RelievalBuffer."User ID";
                            UserSetup.Modify();
                        end
                    until RelievalBuffer.Next() = 0;
            until LeaveApp.Next() = 0;
    end;
}
