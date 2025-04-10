Page 52193678 "User Signature111"
{
    Caption = 'Fixed Asset Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = "User Setup";

    layout
    {
        area(content)
        {
            field(MemberApprovalLimit;"Member Approval Limit")
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    var
        Text001: label 'Do you want to replace the existing picture of %1 %2?';
        Text002: label 'Do you want to delete the picture of %1 %2?';
        PictureExists: Boolean;
}

