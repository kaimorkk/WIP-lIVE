Page 52193814 "Committee Selection"
{
    PageType = Card;
    SourceTable = "Committee Type1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(CommitteeCode;"Committee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Code';
                }
                field(CommitteeName;"Committee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Name';
                }
                field(CommitteeDescription;"Commitee Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Description';
                }
            }
            group(Commisioners)
            {
                Caption = 'Commisioners';
                part(Control1000000010;Attendance)
                {
                    SubPageLink = "Committee Code"=field("Committee Code");
                }
            }
            group(HODs)
            {
                Caption = 'HODs';
                part(Control1000000008;"HOD Attendance Listings")
                {
                    SubPageLink = "Committee Code"=field("Committee Code");
                }
            }
            group(Others)
            {
                Caption = 'Others';
                part(Control1000000011;"Employee Attendance")
                {
                    SubPageLink = "Committee Code"=field("Committee Code");
                }
            }
        }
    }

    actions
    {
    }
}

