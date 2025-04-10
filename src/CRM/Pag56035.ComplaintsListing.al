

page 56035 "Complaints Listing"
{
    CardPageID = "Complaints Card Page";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Complaints Table";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Complain ID"; Rec."Complain ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complain ID field.';
                }
                field("Complaint Type"; Rec."Complaint Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complaint Type field.';
                }
                field("Complainant Name"; Rec."Complainant Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complainant Name field.';
                }
                field("Complainant Phone No"; Rec."Complainant Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complainant Phone No field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Investigating Officer"; Rec."Investigating Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investigating Officer field.';
                }
                field("Investigating officer  Name"; Rec."Investigating officer  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investigating officer  Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Action"; Rec.Action)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action field.';
                }
                field(Responsiblity; Rec.Responsiblity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsiblity field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Expected Resolution Date"; Rec."Expected Resolution Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Resolution Date field.';
                }
                field("Actual Resolution Date"; Rec."Actual Resolution Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Resolution Date field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Case file No"; Rec."Case file No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case file No field.';
                }
                field("Case description"; Rec."Case description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

