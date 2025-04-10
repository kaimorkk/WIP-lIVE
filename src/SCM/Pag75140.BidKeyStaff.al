

page 75140 "Bid Key Staff"
{
    PageType = List;
    SourceTable = "Bid Key Staff";

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
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response No field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Proposed Project Role ID"; Rec."Proposed Project Role ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposed Project Role ID field.';
                }
                field("Required Project Role"; Rec."Required Project Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Project Role field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field(Profession; Rec.Profession)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Profession field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field("Years with Firm"; Rec."Years with Firm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Years with Firm field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup18)
            {
                action("Bid Key Staff Qualification")
                {
                    ApplicationArea = Basic;
                    Image = QualificationOverview;
                    RunObject = Page "Bid Key Staff Qualification";
                    RunPageLink = "Staff No." = field("Staff No.");
                    ToolTip = 'Executes the Bid Key Staff Qualification action.';
                }
                action("Bid Key Staff Experience")
                {
                    ApplicationArea = Basic;
                    Image = FileContract;
                    RunObject = Page "Bid Key Staff Experience";
                    RunPageLink = "Staff No." = field("Staff No.");
                    ToolTip = 'Executes the Bid Key Staff Experience action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Bid Key Staff Qualification_Promoted"; "Bid Key Staff Qualification")
                {
                }
                actionref("Bid Key Staff Experience_Promoted"; "Bid Key Staff Experience")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

