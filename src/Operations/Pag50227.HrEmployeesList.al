namespace ALProjectLIWPA.ALProjectLIWPA;


page 52194417 "HR Employee List ALL"
{
    Caption = 'HR Witness List ALL';
    CardPageId = "HR Employee Card";
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Employee';
    SourceTable = "HR Employees";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Work station"; "Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                    Caption = 'Workstation';
                }
                field("County Name"; Rec."County Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation Name field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Date of Current Employment"; Rec."Date of Current Employment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Current Employment field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company E-Mail field.';
                }
                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incremental Month field.';
                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Responsibility Center field.';
                // }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("New Basic Pay"; Rec."New Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Basic Pay field.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }

                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(DAge; Rec.DAge)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DAge field.';
                }
                field(DPension; Rec.DPension)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DPension field.';
                }
                field("Retirement date"; Rec."Retirement date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement date field.';
                }
                field(Ethnicity; Rec.Ethnicity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnicity field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Global Dimension 1 Code"; Rec.County)
                {
                    ApplicationArea = Basic;
                    Caption = 'Home county';
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorates';
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport Number field.';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number Of Dependants field.';
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Language field.';
                }
                field("AD Status"; "AD Status")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Ad Status';
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Speak field.';
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Write field.';
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Read field.';
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language (R/W/S) field.';
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Speak field.';
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Write field.';
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Read field.';
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language (R/W/S) field.';
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Registration Number field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF No. field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF No. field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field("Total Earnings"; "Total Earnings")
                {
                    ApplicationArea = all;
                    Caption = 'Total Earnings';
                }
            }
        }
        area(FactBoxes) { }
    }

    actions
    {
        area(Processing)
        {
            action("Assign Earning/Deductions")
            {
                ApplicationArea = Basic;
                Caption = 'Assigned Earnings';
                Image = List;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "PR Employee Transactions";
                RunPageLink = "Employee Code" = field("No.");
                ToolTip = 'Executes the Assign Earning/Deductions action.';
            }
            action("Update Salary Increments")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Executes the Update Salary Increments action.';
                trigger OnAction()
                begin
                    //ERROR('Disabled');

                    if Confirm('Update Basic Pay with Values from New Basic Pay, This process cannot be Reversed?') = false then
                        Error('Process Aboreted');

                    HREmp.Reset();
                    HREmp.SetFilter(HREmp."New Basic Pay", '<>%1', 0);
                    if HREmp.Find('-') then begin
                        repeat
                            PRSalCard.Reset();
                            PRSalCard.SetRange(PRSalCard."Employee Code", HREmp."No.");
                            if PRSalCard.Find('-') then begin
                                PRSalCard."Basic Pay" := HREmp."New Basic Pay";
                                PRSalCard.Modify();
                            end;
                            HREmp."New Basic Pay" := 0;
                            HREmp.Modify();
                        until HREmp.Next() = 0;
                        Message('%1 Records Updated', HREmp.Count);
                    end;
                end;
            }
            action(CalculateIncrementalMonth)
            {
                ApplicationArea = Basic;
                Caption = 'Calculate Incremental Month';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Calculate Incremental Month action.';
                trigger OnAction()
                var
                    MonthJoin: Integer;
                    i: Integer;
                    Text00001: Label 'Calculate Incremental Month for all Permanent and Contracted Employees?';
                    DayJoin: Integer;
                begin
                    //DW
                    HREmp.Reset();
                    if HREmp.FindFirst() then
                        repeat
                            HREmp."Incremental Month" := 0;
                            HREmp."Incremental Month" := Rec."Incremental Month"::None;
                            HREmp.Modify();
                        until HREmp.Next() = 0;

                    if not Confirm(Text00001, false) then begin
                        Error('Process Aborted by %1', UserId);
                        exit;
                    end;


                    HREmp.SetFilter("Contract Type", '%1|%2', Rec."Contract Type"::"Permanent and Pensionable", Rec."Contract Type"::Contract);
                    //HREmp.SETFILTER(HREmp."No.",'%1','EMP0002');
                    if HREmp.FindFirst() then begin
                        i := 0;
                        repeat
                            i := i + 1;
                            HREmp.TestField(HREmp."Date of Current Employment");
                            MonthJoin := Date2DMY(HREmp."Date of Current Employment", 2);
                            DayJoin := Date2DMY(HREmp."Date of Current Employment", 1);

                            //ERROR('%1',DayJoin);

                            //********************DECEMBER = JULY ******************
                            if MonthJoin = 12 then begin
                                HREmp."Incremental Month" := 12;
                                HREmp."Incremental Month" := Rec."Incremental Month"::December;
                                HREmp.Modify();
                            end;
                            //********************************************************
                            //********************JANUARY = APRIL ******************
                            if MonthJoin = 1 then begin
                                HREmp."Incremental Month" := 1;
                                HREmp."Incremental Month" := Rec."Incremental Month"::January;
                                HREmp.Modify();
                            end;
                            //********************************************************

                            //********************FEBUARY = APRIL ******************
                            if MonthJoin = 2 then begin
                                HREmp."Incremental Month" := 2;
                                HREmp."Incremental Month" := Rec."Incremental Month"::February;
                                HREmp.Modify();
                            end;
                            //********************************************************
                            //******************** MARCH = APRIL ******************
                            if MonthJoin = 3 then begin
                                HREmp."Incremental Month" := 3;
                                HREmp."Incremental Month" := Rec."Incremental Month"::March;
                                HREmp.Modify();
                            end;
                            //********************************************************
                            //******************** APRIL = JULY ******************
                            if (MonthJoin = 4) then begin
                                HREmp."Incremental Month" := 4;
                                HREmp."Incremental Month" := Rec."Incremental Month"::April;
                                HREmp.Modify();
                            end;
                            //********************************************************

                            //******************** MAY = JULY ******************
                            if MonthJoin = 5 then begin
                                HREmp."Incremental Month" := 5;
                                HREmp."Incremental Month" := Rec."Incremental Month"::May;
                                HREmp.Modify();
                            end;
                            //********************************************************
                            //******************** JUNE = JULY ******************
                            if MonthJoin = 6 then begin
                                HREmp."Incremental Month" := 6;
                                HREmp."Incremental Month" := Rec."Incremental Month"::June;
                                HREmp.Modify();
                            end;
                            //********************************************************

                            //******************** JULY = OCTOBER ******************
                            if MonthJoin = 7 then begin
                                HREmp."Incremental Month" := 7;
                                HREmp."Incremental Month" := Rec."Incremental Month"::July;
                                HREmp.Modify();
                            end;
                            //********************************************************
                            //******************** AUGUST = OCTOBER ******************
                            if MonthJoin = 8 then begin
                                HREmp."Incremental Month" := 8;
                                HREmp."Incremental Month" := Rec."Incremental Month"::August;
                                HREmp.Modify();
                            end;
                            //********************************************************
                            //******************** SEPTEMBER = OCTOBER ******************
                            if MonthJoin = 9 then begin
                                HREmp."Incremental Month" := 9;
                                HREmp."Incremental Month" := Rec."Incremental Month"::September;
                                HREmp.Modify();
                            end;
                            //********************************************************

                            //******************** OCOTOBER = JANUARY ******************
                            if MonthJoin = 10 then begin
                                HREmp."Incremental Month" := 10;
                                HREmp."Incremental Month" := Rec."Incremental Month"::October;

                                HREmp.Modify();
                            end;
                            //********************************************************
                            //******************** NOVEMBER = JANUARY ******************
                            if MonthJoin = 11 then begin
                                HREmp."Incremental Month" := 11;
                                HREmp."Incremental Month" := Rec."Incremental Month"::November;
                                HREmp.Modify();
                            end;
                        //********************************************************
                        until HREmp.Next() = 0;
                        Message('Update Completed Successfully. %1 records have been updated', i);
                    end;
                end;
            }
            action("Update Basic Pay")
            {
                ApplicationArea = Basic;
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Update Basic Pay action.';
                trigger OnAction()
                begin
                    //ERROR('Disabled');

                    if Confirm('Update Basic Pay with Values from New Basic Pay, This process cannot be Reversed?') = false then
                        Error('Process Aboreted');

                    HREmp.Reset();
                    HREmp.SetFilter(HREmp."New Basic Pay", '<>%1', 0);
                    if HREmp.Find('-') then
                        repeat
                            PRSalCard.Reset();
                            if PRSalCard.Get(HREmp."No.") then begin
                                PRSalCard."Basic Pay" := HREmp."New Basic Pay";
                                PRSalCard.Modify();
                            end;
                        until HREmp.Next() = 0;
                    Message('Done');
                end;
            }
            action("Clear New  Basic Pay")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Clear New  Basic Pay action.';
                trigger OnAction()
                begin
                    //eRROR('Disabled');

                    HREmp.Reset();
                    if HREmp.Find('-') then
                        repeat
                            HREmp."New Basic Pay" := 0;
                            HREmp.Modify();
                        until HREmp.Next() = 0;
                end;
            }
            group("&Print")
            {
                Caption = '&Print';
                action("Next of Kin")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter("Next of Kin"));
                    ToolTip = 'Executes the Next of Kin action.';
                }
                action(Beneficiaries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter(Beneficiary));
                    ToolTip = 'Executes the Beneficiaries action.';
                }
                action("Set In-Active")
                {
                    ApplicationArea = Basic;
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Set In-Active action.';
                    trigger OnAction()
                    begin
                        if Confirm('Set Employee %1 as In-Active', false, Rec."No.") = false then
                            Error('aborted');
                        Rec.Status := Rec.Status::Inactive;
                        Rec.Modify();
                    end;
                }

                action("Update Age")
                {
                    ApplicationArea = Basic;
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Update Age action.';
                    trigger OnAction()
                    begin


                        HREmp.Reset();
                        if HREmp.FindSet() then
                            repeat
                            until HREmp.Next() = 0;
                        Message('done');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if (Rec."Date Of Birth" <> 0D) then
            Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);



        if Rec."Retirement date" <> 0D then
            Rec.DPension := Dates.DetermineAge(Today, Rec."Retirement date");
    end;


    var
        HREmp: Record "HR Employees";
        EmployeeFullName: Text;
        Dates: Codeunit "HR Dates";
        PRSalCard: Record "PR Salary Card";
}

