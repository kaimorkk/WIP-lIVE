
tableextension 50077 "tableextension50077" extends "Approval Comment Line"
{
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Imprest Memo,Payment Voucher,Petty Cash, Imprest,Imprest Surrender,Payroll,Store Requisition,Purchase Requisition,Leave Application,Bank Transfer, ';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 3)".

        }
        field(50000; "Approved Days"; Decimal)
        {
            Caption = 'Approved Days';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //CALCULATE THE END DATE AND RETURN DATE
                begin
                    if ("Approved Days" <> 0) and ("Approved Start Date" <> 0D) then
                        "Approved Return Date" := HRLeaveApp.DetermineLeaveReturnDate("Approved Start Date", "Approved Days");
                    //"Approved End Date" := HRLeaveApp.DeterminethisLeaveEndDate(RetDate);
                    //MODIFY;
                end;
            end;
        }
        field(50001; "Approved Start Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //CALCULATE THE END DATE AND RETURN DATE
                begin
                    if ("Approved Days" <> 0) and ("Approved Start Date" <> 0D) then
                        "Approved Return Date" := HRLeaveApp.DetermineLeaveReturnDate("Approved Start Date", "Approved Days");
                    //"Approved End Date" := HRLeaveApp.DeterminethisLeaveEndDate(RetDate);
                    //MODIFY;
                end;
            end;
        }
        field(50002; "Approved Return Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50003; Reason; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50004; "Leave Allowance Granted"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Rejection Reason"; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ApprovalRejectionComments.Get("Rejection Reason") then
                    Comment := ApprovalRejectionComments.Description;
            end;
        }
    }

    var
        HRLeaveApp: Record "HR Leave Application";
        ApprovalRejectionComments: Record "Approval Rejection Comments";

    trigger OnDelete()
    begin
        if "User ID" <> UserId then
            Error('You cannot Delete a comment you did not insert');
    end;

    trigger OnModify()
    begin
        if "User ID" <> UserId then
            Error('You cannot Modify a comment you did not insert');
    end;

    trigger OnRename()
    begin
        if "User ID" <> UserId then
            Error('You cannot Rename a comment you did not insert');
    end;

}

