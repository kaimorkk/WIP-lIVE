

page 75139 "Bid Business Owner"
{
    PageType = List;
    SourceTable = "Bid Business Owner";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Nationality ID"; Rec."Nationality ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality ID field.';
                }
                field("Citizenship Type"; Rec."Citizenship Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship Type field.';
                }
                field("ID/Passport No."; Rec."ID/Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID/Passport No. field.';
                }
                field("Entity Ownership %"; Rec."Entity Ownership %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entity Ownership % field.';
                }
                field("Share Types"; Rec."Share Types")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Share Types field.';
                }
                field("No. of Shares"; Rec."No. of Shares")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Shares field.';
                }
                field("Nominal Value/Share"; Rec."Nominal Value/Share")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominal Value/Share field.';
                }
                field("Total Nominal Value"; Rec."Total Nominal Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Nominal Value field.';
                }
                field("Ownership Effective Date"; Rec."Ownership Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership Effective Date field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

