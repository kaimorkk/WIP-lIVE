Codeunit 52193424 ActionPermisionManagement
{

    trigger OnRun()
    begin
    end;

    var
        ActionPermisions: Record "Action Permission";
        "Actions": Record "Actions";


    procedure CheckUserPermision(ActionID: Code[20])
    begin
        ActionPermisions.Reset;
        ActionPermisions.SetRange(ActionPermisions."Action ID",ActionID);
        ActionPermisions.SetRange(ActionPermisions."User ID",UserId);
        if ActionPermisions.Find('-') = false then begin
          if Actions.Get(ActionID) then begin
            if Actions."No Permission Message" <> '' then
              Error(Actions."No Permission Message")
            else
              Error('You do not have permission to perform this action');
          end else
            Error('You do not have permission to perform this action');
        end;
    end;
}

