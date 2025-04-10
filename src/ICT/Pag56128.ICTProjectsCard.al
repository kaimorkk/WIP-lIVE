

page 56128 "ICT Projects Card"
{
    Caption = 'Projects Card';
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Job;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Project Number';
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = true;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Project Descrption';
                    ToolTip = 'Specifies a short description of the job.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contractor Number';
                    ToolTip = 'Specifies the number of the customer who pays for the job.';
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Contractor Contacts';
                    ToolTip = 'Specifies the number of the contact person at the customer''s billing address.';
                    Visible = true;
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Contractor Name';
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the customer who pays for the job.';
                    Visible = true;
                }
                // field("Road Classes"; Rec."Grant Type")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Road Class';
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Road Class field.';
                // }
                // field("Road Length(KM)"; Rec."Road Length(KM)")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Road Length(KM)';
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Road Length(KM) field.';
                // }
                // field("Funding Source"; Rec."Funding Source")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Funding Source field.';
                // }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the address of the customer to whom you will send the invoice.';
                    Visible = true;
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies an additional line of the address.';
                    Visible = false;
                }
                group(Control56)
                {
                    Visible = IsCountyVisible;
                    field("Bill-to County"; Rec."Bill-to County")
                    {
                        ApplicationArea = Jobs;
                        QuickEntry = false;
                        ToolTip = 'Specifies the county code of the customer''s billing address.';
                        Visible = true;
                    }
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the postal code of the customer who pays for the job.';
                    Visible = true;
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the city of the address.';
                    Visible = true;
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the country/region code of the customer''s billing address.';
                    Visible = true;

                    trigger OnValidate()
                    begin
                        IsCountyVisible := FormatAddress.UseCounty(Rec."Bill-to Country/Region Code");
                    end;
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    ToolTip = 'Specifies the name of the contact person at the customer who pays for the job.';
                    Visible = true;
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Project Manager';
                    ToolTip = 'Specifies the person who is assigned to manage the job.';
                    Visible = JobSimplificationAvailable;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    ToolTip = 'Specifies an additional description of the job for searching purposes.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Investigator';
                    Importance = Promoted;
                    ToolTip = 'Specifies the person at your company who is responsible for the job.';
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies when the job card was last modified.';
                }
                // field("Opportunity Reference"; Rec."Opportunity Reference")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Opportunity Reference field.';
                // }
                // field("Fund Opportunity Name"; Rec."Fund Opportunity Name")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Fund Opportunity Name field.';
                // }
                // field("Grant Amount"; Rec."Grant Amount")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Grant Amount field.';
                // }
                // field(exchequer; Rec.exchequer)
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the exchequer field.';
                // }
            }
            // group("Project Details")
            // {
            //     Visible = false;
            //     field("Research Center"; Rec."Research Center")
            //     {
            //         ApplicationArea = Basic;
            //         Visible = false;
            //         ToolTip = 'Specifies the value of the Research Center field.';
            //     }
            //     field("Research Program"; Rec."Research Program")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Road';
            //         Visible = false;
            //         ToolTip = 'Specifies the value of the Road field.';
            //     }
            //     field("Research Project Area"; Rec."Research Project Area")
            //     {
            //         ApplicationArea = Basic;
            //         Visible = false;
            //         ToolTip = 'Specifies the value of the Research Project Area field.';
            //     }
            //     field("Researcher Code"; Rec."Researcher Code")
            //     {
            //         ApplicationArea = Basic;
            //         Visible = false;
            //         ToolTip = 'Specifies the value of the Researcher Code field.';
            //     }
            // }
            part(JobTaskLines; "Job Task Lines Subform")
            {
                ApplicationArea = Jobs;
                Caption = 'Project Activities';
                SubPageLink = "Job No." = field("No.");
                SubPageView = sorting("Job Task No.")
                              order(ascending);
            }
            group(Posting)
            {
                Caption = 'Posting';
                field(Status; Rec.Status)
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies a current status of the job. You can change the status for the job as it progresses. Final calculations can be made on completed jobs.';

                    trigger OnValidate()
                    begin
                        if (Rec.Status = Rec.Status::Completed) and Rec.Complete then begin
                            Rec.RecalculateJobWIP;
                            CurrPage.Update(false);
                        end;
                    end;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the posting group that links transactions made for the job with the appropriate general ledger accounts according to the general posting setup.';
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    ToolTip = 'Specifies the method that is used to calculate the value of work in process for the job.';
                }
                field("WIP Posting Method"; Rec."WIP Posting Method")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    ToolTip = 'Specifies how WIP posting is performed. Per Job: The total WIP costs and the sales value is used to calculate WIP. Per Job Ledger Entry: The accumulated values of WIP costs and sales are used to calculate WIP.';
                }
                field("Allow Schedule/Contract Lines"; Rec."Allow Schedule/Contract Lines")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Allow Budget/Billable Lines';
                    Importance = Additional;
                    ToolTip = 'Specifies if you can add planning lines of both type Budget and type Billable to the job.';
                }
                field("Apply Usage Link"; Rec."Apply Usage Link")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    ToolTip = 'Specifies whether usage entries, from the job journal or purchase line, for example, are linked to job planning lines. Select this check box if you want to be able to track the quantities and amounts of the remaining work needed to complete a job and to create a relationship between demand planning, usage, and sales. On a job card, you can select this check box if there are no existing job planning lines that include type Budget that have been posted. The usage link only applies to job planning lines that include type Budget.';
                }
                field("% Completed"; Rec.PercentCompleted)
                {
                    ApplicationArea = Jobs;
                    Caption = '% Completed';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the percentage of the job''s estimated resource usage that has been posted as used.';
                }
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    ApplicationArea = Jobs;
                    Caption = '% Invoiced';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the percentage of the job''s invoice value that has been posted as invoiced.';
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue)
                {
                    ApplicationArea = Jobs;
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the percentage of the job''s planning lines where the planned delivery date has been exceeded.';
                }
            }
            group(Duration)
            {
                Caption = 'Duration';
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date on which the job actually starts.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date on which the job is expected to be completed.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the date on which you set up the job.';
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the currency code for the job. By default, the currency code is empty. If you enter a foreign currency code, it results in the job being planned and invoiced in that currency.';
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency code you want to apply when creating invoices for a job. By default, the invoice currency code for a job is based on what currency code is defined on the customer card.';
                }
                field("Exch. Calculation (Cost)"; Rec."Exch. Calculation (Cost)")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how job costs are calculated if you change the Currency Date or the Currency Code fields on a job planning Line or run the Change Job Planning Line Dates batch job. Fixed LCY option: The job costs in the local currency are fixed. Any change in the currency exchange rate will change the value of job costs in a foreign currency. Fixed FCY option: The job costs in a foreign currency are fixed. Any change in the currency exchange rate will change the value of job costs in the local currency.';
                }
                field("Exch. Calculation (Price)"; Rec."Exch. Calculation (Price)")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how job sales prices are calculated if you change the Currency Date or the Currency Code fields on a job planning Line or run the Change Job Planning Line Dates batch job. Fixed LCY option: The job prices in the local currency are fixed. Any change in the currency exchange rate will change the value of job prices in a foreign currency. Fixed FCY option: The job prices in a foreign currency are fixed. Any change in the currency exchange rate will change the value of job prices in the local currency.';
                }
            }
            group("WIP and Recognition")
            {
                Caption = 'WIP and Recognition';
                group("To Post")
                {
                    Caption = 'To Post';
                    field("WIP Posting Date"; Rec."WIP Posting Date")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the posting date that was entered when the Job Calculate WIP batch job was last run.';
                    }
                    field("Total WIP Sales Amount"; Rec."Total WIP Sales Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP sales amount that was last calculated for the job. The WIP sales amount is the value in the WIP Sales Job WIP Entries window minus the value of the Recognized Sales Job WIP Entries window. For jobs with the Cost Value or Cost of Sales WIP methods, the WIP sales amount is normally 0.';
                    }
                    field("Applied Sales G/L Amount"; Rec."Applied Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of all applied sales in the general ledger that are related to the job.';
                        Visible = false;
                    }
                    field("Total WIP Cost Amount"; Rec."Total WIP Cost Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP cost amount that was last calculated for the job. The WIP cost amount is the value in the WIP Cost Job WIP Entries window minus the value of the Recognized Cost Job WIP Entries window. For jobs with Sales Value or Percentage of Completion WIP methods, the WIP cost amount is normally 0.';
                    }
                    field("Applied Costs G/L Amount"; Rec."Applied Costs G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of all applied costs that is based on to the selected job in the general ledger.';
                        Visible = false;
                    }
                    field("Recog. Sales Amount"; Rec."Recog. Sales Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the recognized sales amount that was last calculated for the job, which is the sum of the Recognized Sales Job WIP Entries.';
                    }
                    field("Recog. Costs Amount"; Rec."Recog. Costs Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the recognized cost amount that was last calculated for the job. The value is the sum of the entries in the Recognized Cost Job WIP Entries window.';
                    }
                    field("Recog. Profit Amount"; Rec.CalcRecognizedProfitAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit Amount';
                        ToolTip = 'Specifies the recognized profit amount for the job.';
                    }
                    field("Recog. Profit %"; Rec.CalcRecognizedProfitPercentage)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit %';
                        ToolTip = 'Specifies the recognized profit percentage for the job.';
                    }
                    field("Acc. WIP Costs Amount"; Rec.CalcAccWIPCostsAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Acc. WIP Costs Amount';
                        ToolTip = 'Specifies the total WIP costs for the job.';
                        Visible = false;
                    }
                    field("Acc. WIP Sales Amount"; Rec.CalcAccWIPSalesAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Acc. WIP Sales Amount';
                        ToolTip = 'Specifies the total WIP sales for the job.';
                        Visible = false;
                    }
                    field("Calc. Recog. Sales Amount"; Rec."Calc. Recog. Sales Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized sales amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                    field("Calc. Recog. Costs Amount"; Rec."Calc. Recog. Costs Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized costs amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                }
                group(Posted)
                {
                    Caption = 'Posted';
                    field("WIP G/L Posting Date"; Rec."WIP G/L Posting Date")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the posting date that was entered when the Job Post WIP to General Ledger batch job was last run.';
                    }
                    field("Total WIP Sales G/L Amount"; Rec."Total WIP Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP sales amount that was last posted to the general ledger for the job. The WIP sales amount is the value in the WIP Sales Job WIP G/L Entries window minus the value in the Recognized Sales Job WIP G/L Entries window. For jobs with the Cost Value or Cost of Sales WIP methods, the WIP sales amount is normally 0.';
                    }
                    field("Total WIP Cost G/L Amount"; Rec."Total WIP Cost G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP Cost amount that was last posted to the G/L for the job. The WIP Cost Amount for the job is the value WIP Cost Job WIP G/L Entries less the value of the Recognized Cost Job WIP G/L Entries. For jobs with WIP Methods of Sales Value or Percentage of Completion, the WIP Cost Amount is normally 0.';
                    }
                    field("Recog. Sales G/L Amount"; Rec."Recog. Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total recognized sales amount that was last posted to the general ledger for the job. The recognized sales G/L amount for the job is the sum of the entries in the Recognized Sales Job WIP G/L Entries window.';
                    }
                    field("Recog. Costs G/L Amount"; Rec."Recog. Costs G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total Recognized Cost amount that was last posted to the general ledger for the job. The Recognized Cost G/L amount for the job is the sum of the Recognized Cost Job WIP G/L Entries.';
                    }
                    field("Recog. Profit G/L Amount"; Rec.CalcRecognizedProfitGLAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit G/L Amount';
                        ToolTip = 'Specifies the profit amount that is recognized with the general ledger for the job.';
                    }
                    field("Recog. Profit G/L %"; Rec.CalcRecognProfitGLPercentage)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit G/L %';
                        ToolTip = 'Specifies the profit percentage that is recognized with the general ledger for the job.';
                    }
                    field("Calc. Recog. Sales G/L Amount"; Rec."Calc. Recog. Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized sales general ledger amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                    field("Calc. Recog. Costs G/L Amount"; Rec."Calc. Recog. Costs G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized costs general ledger amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(167),
                              "No." = field("No.");
            }
            part(Control1902136407; "Job No. of Prices FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("No."),
                              "Resource Filter" = field("Resource Filter"),
                              "Posting Date Filter" = field("Posting Date Filter"),
                              "Resource Gr. Filter" = field("Resource Gr. Filter"),
                              "Planning Date Filter" = field("Planning Date Filter");
                Visible = true;
            }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("No."),
                              "Resource Filter" = field("Resource Filter"),
                              "Posting Date Filter" = field("Posting Date Filter"),
                              "Resource Gr. Filter" = field("Resource Gr. Filter"),
                              "Planning Date Filter" = field("Planning Date Filter");
                Visible = false;
            }
            part(Control44; "Job Cost Factbox")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Details';
                SubPageLink = "No." = field("No.");
                Visible = JobSimplificationAvailable;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action(JobPlanningLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (Budget) or you can specify what you actually agreed with your customer that he should pay for the job (Billable).';

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        Rec.TestField("No.");
                        JobPlanningLine.FilterGroup(2);
                        JobPlanningLine.SetRange("Job No.", Rec."No.");
                        JobPlanningLine.FilterGroup(0);
                        JobPlanningLines.SetJobTaskNoVisible(true);
                        JobPlanningLines.SetTableview(JobPlanningLine);
                        JobPlanningLines.Editable := true;
                        JobPlanningLines.Run;
                    end;
                }
                action("&Dimensions")
                {
                    ApplicationArea = Dimensions;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(167),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to journal lines to distribute costs and analyze transaction history.';
                }
                action("Project Funding Sources")
                {
                    ApplicationArea = Basic;
                    Image = MapSetup;
                    RunObject = Page "Funding Source List";
                    ToolTip = 'Executes the Project Funding Sources action.';
                }
                action("Initate Procurement Process")
                {
                    ApplicationArea = Basic;
                    Image = Process;
                    RunObject = Page "Funding Source List";
                    ToolTip = 'Executes the Initate Procurement Process action.';
                }
                action("Project Funding Line")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    // RunObject = Page "Project Funding Line";
                    // RunPageLink = "Project No" = field("No.");
                    ToolTip = 'Executes the Project Funding Line action.';
                }
                action("&Statistics")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Statistics';
                    Image = Statistics;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View this job''s statistics.';
                }
                action("Generate Payment Certificate")
                {
                    ApplicationArea = Basic;
                    Image = CalculateConsumption;
                    RunObject = Report "Customer - List";
                    ToolTip = 'Executes the Generate Payment Certificate action.';
                }
                separator(Action64)
                {
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Job),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action("&Online Map")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Online Map';
                    Image = Map;
                    ToolTip = 'View online map for addresses assigned to this job.';

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    ApplicationArea = Jobs;
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = Page "Job WIP Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date")
                                  order(descending);
                    ToolTip = 'View entries for the job that are posted as work in process.';
                }
                action("WIP &G/L Entries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = Page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.")
                                  order(descending);
                    ToolTip = 'View the job''s WIP G/L entries.';
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action("&Resource")
                {
                    ApplicationArea = Suite;
                    Caption = '&Resource';
                    Image = Resource;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s resource prices.';
                }
                action("&Item")
                {
                    ApplicationArea = Suite;
                    Caption = '&Item';
                    Image = Item;
                    RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s item prices.';
                }
                action("&G/L Account")
                {
                    ApplicationArea = Suite;
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    RunObject = Page "Job G/L Account Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s G/L account prices.';
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Allocated per Job")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Resource Allocated per Job";
                    ToolTip = 'View this job''s resource allocation.';
                }
                action("Res. Gr. All&ocated per Job")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Res. Gr. All&ocated per Job';
                    Image = ResourceGroup;
                    RunObject = Page "Res. Gr. Allocated per Job";
                    ToolTip = 'View the job''s resource group allocation.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ledger E&ntries';
                    Image = JobLedger;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
            group("Task Lines")
            {
                action("Populate Task Lines")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    ToolTip = 'Executes the Populate Task Lines action.';
                    // trigger OnAction()
                    // begin
                    //     ProjectTemplates.Reset;
                    //     ProjectTemplates.SetRange(Blocked, false);
                    //     ProjectTemplates.SetFilter("Project  Task No.", '<>%1', '');
                    //     if ProjectTemplates.Find('-') then begin
                    //         repeat
                    //             JobTaskLines.Reset;
                    //             JobTaskLines.SetRange("Job No.", Rec."No.");
                    //             JobTaskLines.SetRange("Job Task No.", ProjectTemplates."Project  Task No.");
                    //             if not JobTaskLines.FindSet then begin

                    //                 JobTaskLines.Init;
                    //                 JobTaskLines."Job No." := Rec."No.";
                    //                 JobTaskLines."Job Task No." := ProjectTemplates."Project  Task No.";
                    //                 JobTaskLines.Description := ProjectTemplates."Project Description";
                    //                 JobTaskLines.Insert(true);
                    //             end;
                    //         until ProjectTemplates.Next = 0;
                    //     end;
                    //     Message('Job Task Lines loaded successfully');
                    // end;
                }
            }
        }
        area(processing)
        {
            group("&Copy")
            {
                Caption = '&Copy';
                Image = Copy;
                action("Copy Job Tasks &from...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Job Tasks &from...';
                    Ellipsis = true;
                    Image = CopyToTask;
                    ToolTip = 'Open the Copy Job Tasks page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
                action("Copy Project Activities &to...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Project Activities &to...';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    ToolTip = 'Open the Copy Jobs To page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
            }
            group(ActionGroup26)
            {
                Caption = 'W&IP';
                Image = WIP;
                action("<Action82>")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Calculate WIP';
                    Ellipsis = true;
                    Image = CalculateWIP;
                    ToolTip = 'Run the Job Calculate WIP batch job.';

                    trigger OnAction()
                    var
                        Job: Record Job;
                    begin
                        Rec.TestField("No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Job Calculate WIP", true, false, Job);
                    end;
                }
                action("<Action83>")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Post WIP to G/L';
                    Ellipsis = true;
                    Image = PostOrder;
                    ShortCutKey = 'F9';
                    ToolTip = 'Run the Job Post WIP to G/L batch job.';

                    trigger OnAction()
                    var
                        Job: Record Job;
                    begin
                        Rec.TestField("No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Job Actual to Budget")
            {
                ApplicationArea = Suite;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                RunObject = Report "Job Actual To Budget";
                ToolTip = 'Compare budgeted and usage amounts for selected jobs. All lines of the selected job show quantity, total cost, and line amount.';
            }
            action("Job Analysis")
            {
                ApplicationArea = Suite;
                Caption = 'Job Analysis';
                Image = "Report";
                RunObject = Report "Job Analysis";
                ToolTip = 'Analyze the job, such as the budgeted prices, usage prices, and billable prices, and then compares the three sets of prices.';
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                RunObject = Report "Job - Planning Lines";
                ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                RunObject = Report "Job Suggested Billing";
                ToolTip = 'View a list of all jobs, grouped by customer, how much the customer has already been invoiced, and how much remains to be invoiced, that is, the suggested billing.';
            }
            action("Report Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Preview Job Quote';
                Image = "Report";
                ToolTip = 'Open the Job Quote report.';

                trigger OnAction()
                var
                    Job: Record Job;
                begin
                    Job.SetCurrentkey("No.");
                    Job.SetFilter("No.", Rec."No.");
                    Report.Run(Report::"Job Quote", true, false, Job);
                end;
            }
            action("Send Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Send Job Quote';
                Image = SendTo;
                ToolTip = 'Send the job quote to the customer. You can change the way that the document is sent in the window that appears.';

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Jobs-Send", Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref("Project Funding Sources_Promoted"; "Project Funding Sources")
                {
                }
                actionref("Project Funding Line_Promoted"; "Project Funding Line")
                {
                }
                actionref("Generate Payment Certificate_Promoted"; "Generate Payment Certificate")
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Copy Job Tasks &from..._Promoted"; "Copy Job Tasks &from...")
                {
                }
                actionref("Copy Project Activities &to..._Promoted"; "Copy Project Activities &to...")
                {
                }
                actionref("Initate Procurement Process_Promoted"; "Initate Procurement Process")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref("Job Actual to Budget_Promoted"; "Job Actual to Budget")
                {
                }
                actionref("Job Analysis_Promoted"; "Job Analysis")
                {
                }
                actionref("Job - Planning Lines_Promoted"; "Job - Planning Lines")
                {
                }
                actionref("Job - Suggested Billing_Promoted"; "Job - Suggested Billing")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Prices', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("&G/L Account_Promoted"; "&G/L Account")
                {
                }
                actionref("Populate Task Lines_Promoted"; "Populate Task Lines")
                {
                }
                actionref("&Resource_Promoted"; "&Resource")
                {
                }
                actionref("&Item_Promoted"; "&Item")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'WIP', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("<Action82>_Promoted"; "<Action82>")
                {
                }
                actionref("<Action83>_Promoted"; "<Action83>")
                {
                }
                actionref("&WIP Entries_Promoted"; "&WIP Entries")
                {
                }
                actionref("WIP &G/L Entries_Promoted"; "WIP &G/L Entries")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(JobPlanningLines_Promoted; JobPlanningLines)
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Job', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref("&Dimensions_Promoted"; "&Dimensions")
                {
                }
                actionref("&Statistics_Promoted"; "&Statistics")
                {
                }
                actionref("Ledger E&ntries_Promoted"; "Ledger E&ntries")
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Print/Send', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref("Report Job Quote_Promoted"; "Report Job Quote")
                {
                }
                actionref("Send Job Quote_Promoted"; "Send Job Quote")
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        JobSimplificationAvailable := Rec.IsJobSimplificationAvailable;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Rec."Road Project Type" := Rec."road project type"::"ICT Project";
    end;

    trigger OnOpenPage()
    begin

        //Ushindi
        // Rec.CalcFields("Project Budget", "Actual Project Costs", "PO Commitments", "PRN Commitments", "Store Requisition Commitments", "Imprest Application Commitment");
        // TotalBudgetCommitments := Rec."PO Commitments" + Rec."PRN Commitments" + Rec."Store Requisition Commitments" + Rec."Imprest Application Commitment";
        // AvailableFunds := Rec."Project Budget" - Rec."Actual Project Costs" - TotalBudgetCommitments;
        //Ushindi

        SetNoFieldVisible;
        IsCountyVisible := FormatAddress.UseCounty(Rec."Bill-to Country/Region Code");
    end;

    var
        FormatAddress: Codeunit "Format Address";
        JobSimplificationAvailable: Boolean;
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;
        NoFieldVisible: Boolean;
        IsCountyVisible: Boolean;
        JobTaskLines: Record "Job Task";
        // ProjectTemplates: Record "Project Templates";

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.Update;
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.JobNoIsVisible;
    end;
}

#pragma implicitwith restore

