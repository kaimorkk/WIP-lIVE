page 50332 "Tyre Requisitions"
{
    ApplicationArea = All;
    Caption = 'Tyre Requisitions';
    PageType = List;
    CardPageId = "Tyre Requisition";
    SourceTable = "Tyre Requisition";
    Editable = false;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Requester; Rec.Requester)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requester field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field("Tyre size Requested"; Rec."Tyre size Requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tyre size field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User field.';
                }
                field("User Type"; Rec."User Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Type field.';
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mobile No. field.';
                }
                field("Issuing Officer"; Rec."Issuing Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issuing Officer field.';
                }
                field(Mileage; Rec.Mileage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mileage field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Current Mileage"; Rec."Current Mileage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Mileage field.';
                }
            }


        }



    }
}
