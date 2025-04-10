

page 75156 "Bid Opening Register Line"
{
    PageType = ListPart;
    SourceTable = "Bid Opening Register Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Bid Number"; Rec."Bid Number")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bid Number field.';
                }
                field("Bid Submission No"; Rec."Bid Submission No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bid Submission No field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No. field.';
                }
                field("External Bid Reference No"; Rec."External Bid Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Bid Reference No field.';
                }
                // field("Valid Bid Security Provided"; Rec."Valid Bid Security Provided")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Valid Bid Security Provided field.';
                // }
                // field("Bid Security Issuer"; Rec."Bid Security Issuer")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Bid Security Issuer field.';
                // }
                // field("Bid Security Amount (LCY)"; Rec."Bid Security Amount (LCY)")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Bid Security Amount (LCY) field.';
                // }
                // field("Bid Security Amount Pass"; Rec."Bid Security Amount Pass")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Bid Security Amount Pass field.';
                // }
                field("Total Tender Price (LCY)"; Rec."Total Tender Price (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Tender Price (LCY) field.';
                }
                field("Complete Bid Doc Submitted"; Rec."Complete Bid Doc Submitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complete Bid Doc Submitted field.';
                }
                // field("Late Bid"; Rec."Late Bid")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Late Bid field.';
                // }
                // field("Late Bid Submission Time"; Rec."Late Bid Submission Time")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Late Bid Submission Time field.';
                // }
                field("Bid Withdrawal Notice No."; Rec."Bid Withdrawal Notice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Withdrawal Notice No. field.';
                }
                // field("Bid Modification Notice No."; Rec."Bid Modification Notice No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Bid Modification Notice No. field.';
                // }
                field("Bid Withdrawal Exists"; Rec."Bid Withdrawal Exists")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Withdrawal Exists field.';
                }
                // field("Bid Modification Exists"; Rec."Bid Modification Exists")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Bid Modification Exists field.';
                // }
                field("Final Bid Opening Result"; Rec."Final Bid Opening Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Bid Opening Result field.';
                }
                field("Tender Opening Com Remarks"; Rec."Tender Opening Com Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Opening Com Remarks field.';
                }
                field("No. of Representatives"; Rec."No. of Representatives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Representatives field.';
                }
                // field(Notified; Rec.Notified)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Notified field.';
                // }
                // field("Date/Time Notified"; Rec."Date/Time Notified")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Date/Time Notified field.';
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Bidder Attendance")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = Code = field(Code),
                                  "IFS Code" = field("IFS Code"),
                                  "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Bidder Attendance action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

