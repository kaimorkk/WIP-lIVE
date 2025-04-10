 
  table  52194116 "Wip Header Registration"
{
    Caption = 'HR WIP Registration';
    //DataCaptionFields = "No.", "Full Name", "Job Title";
    DrillDownPageId = "Hr Employee Registration List";
    LookupPageId = "Hr Employee Registration List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                NewStr: Code[20];
                HrSetup:Record "Human Resources Setup";
            begin
                //To delete spaces inbetween numbers
                // NewStr:=DELCHR("No.");
                //mm
                if "No." <> xRec."No." then begin
                    HrSetup.Get();
                    NoSeriesMgt.TestManual(HrSetup."Employee Nos.");
                    "No. Series" := '';
                end;

                NewStr := DelChr("No.");
            end;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
            trigger OnValidate()
            begin

                fn_FullName();
            end;
        }
        field(3; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
            trigger OnValidate()
            begin
                fn_FullName();
            end;
        }
        field(4; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            trigger OnValidate()
            begin
                fn_FullName();
            end;
        }
        field(5; Initials; Text[15])
        {
            Caption = 'Initials';
        }
        field(7; "Full Name"; Text[60])
        {
            Caption = 'Full Name';
        }
        field(8; "Postal Address"; Text[50])
        {
            Caption = 'Postal Address';
        }
        field(9; "Residential Address"; Text[50])
        {
            Caption = 'Residential Address';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            Caption = 'Post Code';
            trigger OnValidate()
            begin
                PostCode.Reset();
                PostCode.SetRange(PostCode.Code, "Post Code");
                if PostCode.Find('-') then
                    City := PostCode.City;
            end;
        }
        field(13; "Home Phone Number"; Text[30])
        {
            Caption = 'Home Phone Number';
        }
        field(14; "Cellular Phone Number"; Text[30])
        {
            Caption = 'Cellular Phone Number';
        }
        field(15; "Work Phone Number"; Text[30])
        {
            Caption = 'Work Phone Number';
        }
        field(16; "Ext."; Text[7])
        {
            Caption = 'Ext.';
        }
        field(17; "E-Mail"; Text[30])
        {
            ExtendedDatatype = EMail;
            Caption = 'E-Mail';
        }
        field(18; sec; Date)
        {
            Description = 'seconded start date';
            Caption = 'sec';
            trigger OnValidate()
            begin
                //Morris code for Seconded/Contract
                sec2 := 0D;

                if ("Contract Type" = "Contract Type"::Contract) and ("Contract Duration" <> '') then
                    sec2 := CalcDate(secdur, sec);
            end;
        }
        field(19; Picture; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Picture';
        }
        field(21; "ID Number"; Code[20])
        {
            Caption = 'ID Number';
            trigger OnValidate()
            var
                myInt: Integer;
                hremployee: Record "HR Employees";
            begin
                hremployee.Reset();
                hremployee.SetRange("ID Number", Rec."ID Number");
                hremployee.SetRange(Status, Status::Active);
                if hremployee.FindFirst() then
                    Error('You cannot share the id number with employee no. %1', hremployee."No.");

            end;

        }
        field(22; "Union Code"; Code[10])
        {
            TableRelation = Union;
            Caption = 'Union Code';
        }
        field(23; "UIF Number"; Text[10])
        {
            Caption = 'UIF Number';
        }
        field(24; Gender; Option)
        {
            OptionMembers = " ",Male,Female;
            Caption = 'Gender';
        }

        field(28; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
            Caption = 'Statistics Group Code';
        }
        field(29; secdur; Code[10])
        {
            Description = 'seconded duration';
            Caption = 'secdur';
            trigger OnValidate()
            begin

                //Morris Code for seconded/contract

                sec2 := 0D;
                sec2 := CalcDate(secdur, sec);
            end;
        }
        field(30; sec2; Date)
        {
            Description = 'seconded end date';
            Caption = 'sec2';
        }
        field(31; Status; Option)
        {
            Editable = true;
            OptionMembers = Active,Inactive,New,"Pending Approval",Rejected;
            Caption = 'Status';
            trigger OnValidate()
            var
                HrEemployeRec: Record "HR Employees";
                EmplRec: Record "HR Employees";
                Status: Option Active,Inactive;

            begin

                "Status Change Date" := Today;
                if rec."Approval Status" = Rec."Approval Status"::Approved then begin
                    Status := Status::Active;
                    HrEemployeRec.Reset();
                    HrEemployeRec.SetRange("No.", rec."No.");
                    if not HrEemployeRec.FindFirst() then begin
                        HrEemployeRec.Init();
                        HrEemployeRec."No." := Rec."No.";
                        HrEemployeRec."First Name" := Rec."First Name";
                        HrEemployeRec."Middle Name" := rec."Middle Name";
                        HrEemployeRec."Last Name" := Rec."Last Name";
                        HrEemployeRec."Full Name" := rec."Full Name";
                        HrEemployeRec."Marital Status" := rec."Marital Status";
                        HrEemployeRec."Current Duty Station" := rec."Current Duty Station";
                        HrEemployeRec."Job ID" := rec."Job ID";
                        HrEemployeRec."Global Dimension 2 Code" := rec."Global Dimension 2 Code";
                        HrEemployeRec.Validate(HrEemployeRec."Global Dimension 2 Code");
                        HrEemployeRec.Gender := rec.Gender;
                        HrEemployeRec."Responsibility Center" := rec."Responsibility Center";
                        HrEemployeRec.Validate(HrEemployeRec."Responsibility Center");
                        HrEemployeRec.Title := Rec.Title;
                        HrEemployeRec.Disabled := rec.Gender;
                        HrEemployeRec."Company E-Mail" := rec."Company E-Mail";
                        HrEemployeRec."Job Title" := rec."Job Title";
                        HrEemployeRec."Job Group Range" := rec."Job Group Range";
                        HrEemployeRec.Initials := Rec.Initials;
                        HrEemployeRec."Postal Address" := Rec."Postal Address";
                        HrEemployeRec."Residential Address" := rec."Residential Address";
                        HrEemployeRec.City := Rec.City;
                        HrEemployeRec.Citizenship := rec.Citizenship;
                        HrEemployeRec."Post Code" := Rec."Post Code";
                        HrEemployeRec."Cell Phone Number" := rec."Cell Phone Number";
                        HrEemployeRec."Home Phone Number" := rec."Home Phone Number";
                        HrEemployeRec."Home District" := Rec."Home District";
                        HrEemployeRec."Date Of Birth" := rec."Date Of Birth";
                        HrEemployeRec."Contract Duration" := rec."Contract Duration";
                        HrEemployeRec."Contract End Date" := Rec."Contract End Date";
                        HrEemployeRec.County := Rec.County;
                        HrEemployeRec."County Name" := Rec."County Name";
                        HrEemployeRec."Account Type" := Rec."Account Type";
                        HrEemployeRec.Age := Rec.Age;
                        HrEemployeRec.Status := HrEemployeRec.Status::Active;
                        HrEemployeRec."NSSF No." := Rec."NSSF No.";
                        HrEemployeRec."Net Pay" := Rec."Net Pay";
                        HrEemployeRec."NHIF No." := rec."NHIF No.";
                        HrEemployeRec."Passport Number" := rec."Passport Number";
                        HrEemployeRec."Basic Pay" := Rec."Basic Pay";
                        HrEemployeRec."Bank Account Number" := HrEemployeRec."Bank Account Number";
                        HrEemployeRec."Branch Bank" := rec."Branch Bank";
                        HrEemployeRec."Contract Type" := rec."Contract Type";
                        HrEemployeRec."Contract Start Date" := rec."Contract Start Date";
                        HrEemployeRec."PIN No." := rec."PIN No.";
                        HrEemployeRec.Position := rec.Position;
                        HrEemployeRec.CalcFields(Picture);
                        rec.CalcFields(Picture);
                        HrEemployeRec.Picture := Rec.Picture;
                        HrEemployeRec."E-Mail" := rec."E-Mail";
                        HrEemployeRec."ID Number" := rec."ID Number";
                        HrEemployeRec.Insert();
                        // EmplRec.Reset();
                        // EmplRec.SetRange(EmplRec."No.", Rec."No.");
                        // if EmplRec.FindFirst() then begin
                        //     EmplRec.Status := EmplRec.Status::Active;
                        //     EmplRec.Modify();
                        // end;
                        Message('Employee details created successfully');
                    end;
                end;
            end;
        }
        field(35; "Location/Division Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            Caption = 'Location/Division Code';
            trigger OnValidate()
            begin
                // if SalCard.Get("No.") then begin
                //     SalCard."Identification Number" := "Location/Division Code";
                //     SalCard.Modify();
                // end;
            end;
        }
        field(36; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            trigger OnValidate()
            begin
                // if SalCard.Get("No.") then begin
                //     SalCard."Mobile Number" := "Department Code";
                //     SalCard.Modify();
                // end;
            end;
        }
        field(37; Office; Code[20])
        {
            Description = 'Dimension 2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
            Caption = 'Office';
        }
        field(38; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(39; Comment; Boolean)
        {
            Editable = false;
            Caption = 'Comment';
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
            Caption = 'Last Date Modified';
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date Filter';
        }
        field(42; "Department Filter 1"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            Caption = 'Department Filter 1';
        }
        field(43; "Office Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Office Filter';
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
            Caption = 'Employee No. Filter';
        }
        field(51; Title; Option)
        {
            OptionCaption = ',MR,MRS,MISS,MS,DR, ENG.,CC,Prof';
            OptionMembers = ,MR,MRS,MISS,MS,DR," ENG.",CC,Prof;
            Caption = 'Title';
        }

        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(55; Position; Text[30])
        {
            Caption = 'Position';
        }
        field(57; "Full / Part Time"; Option)
        {
            OptionMembers = " ","Full Time"," Part Time",Contract;
            Caption = 'Full / Part Time';
        }
        field(58; "Contract Type"; Option)
        {
            OptionMembers = " ",Contract,Deployed,"Seconded/Contract",Intern,Casuals,"Permanent and Pensionable",Probation;
            Caption = 'Contract Type';
            trigger OnValidate()
            var
                myInt: Integer;
                HrSetup:Record "Human Resources Setup";
            begin
                if xRec."Contract Type" <> Rec."Contract Type" then
                    if rec."Contract Type" = rec."Contract Type"::Deployed then begin
                        if "No." <> '' then begin
                            rec."No." := '';
                        end;
                        HrSetup.Get();
                        // HrSetup.TestField("Deployed Nos");
                        // NoSeriesMgt.InitSeries(HrSetup."Deployed Nos", xRec."No. Series", 0D, "No.", "No. Series");
                        // if StrLen(Rec."No.") < 10 then
                        // Error('Minimum Characters for an employee No. should be 10');
                    end;
                 
                // if rec."Contract Type" = rec."Contract Type"::"Permanent and Pensionable" then begin
                //     // if "No." = '' then begin
                //     HrSetup.Get();
                //     HrSetup.TestField("PNP Nos");
                //     NoSeriesMgt.InitSeries(HrSetup."PNP Nos", xRec."No. Series", 0D, "No.", "No. Series");
                //     if StrLen(Rec."No.") < 10 then
                //         Error('Minimum Characters for an employee No. should be 10');
                // end;
                // if rec."Contract Type" = rec."Contract Type"::Contract then begin
                //     // if "No." = '' then begin
                //     HrSetup.Get();
                //     HrSetup.TestField("Contract Emp NOs");
                //     NoSeriesMgt.InitSeries(HrSetup."Contract Emp NOs", xRec."No. Series", 0D, "No.", "No. Series");
                //     if StrLen(Rec."No.") < 10 then
                //         Error('Minimum Characters for an employee No. should be 10');
                // end;
                // if rec."Contract Type" = rec."Contract Type"::Probation then begin
                //     // if "No." = '' then begin
                //     HrSetup.Get();
                //     HrSetup.TestField("Probation Nos");
                //     NoSeriesMgt.InitSeries(HrSetup."Probation Nos", xRec."No. Series", 0D, "No.", "No. Series");
                //     if StrLen(Rec."No.") < 10 then
                //         Error('Minimum Characters for an employee No. should be 10');
                // end;
                // if rec."Contract Type" = rec."Contract Type"::Casuals then begin
                //     // if "No." = '' then begin
                //     HrSetup.Get();
                //     HrSetup.TestField("Casual NOs");
                //     NoSeriesMgt.InitSeries(HrSetup."Casual NOs", xRec."No. Series", 0D, "No.", "No. Series");
                //     if StrLen(Rec."No.") < 10 then
                //         Error('Minimum Characters for an employee No. should be 10');
                // end;

            end;
        }
        field(59; "Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
        }
        field(60; "Notice Period"; Code[10])
        {
            Caption = 'Notice Period';
        }
        field(61; "Union Member?"; Boolean)
        {
            Caption = 'Union Member?';
        }
        field(62; "Shift Worker?"; Boolean)
        {
            Caption = 'Shift Worker?';
        }
        field(63; "Contracted Hours"; Decimal)
        {
            Caption = 'Contracted Hours';
        }
        field(64; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
            Caption = 'Pay Period';
        }
        field(65; "Pay Per Period"; Decimal)
        {
            Caption = 'Pay Per Period';
        }

        field(68; "Secondment Institution"; Text[30])
        {
            Caption = 'Secondment Institution';
        }
        field(69; "UIF Contributor?"; Boolean)
        {
            Caption = 'UIF Contributor?';
        }
        field(73; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
            Caption = 'Marital Status';
        }
        field(74; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
            Caption = 'Ethnic Origin';
        }
        field(75; "First Language (R/W/S)"; Code[10])
        {
            Caption = 'First Language (R/W/S)';
        }
        field(76; "Driving Licence"; Code[10])
        {
            Caption = 'Driving Licence';
        }
        field(77; "Vehicle Registration Number"; Code[10])
        {
            Caption = 'Vehicle Registration Number';
        }
        field(78; Disabled; Option)
        {
            Caption = 'PWD';
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            var
                HrSetup: Record "Human Resources Setup";
            begin
                rec.TestField("Date Of Birth");
                HrSetup.Get();
                "Retirement date" := 0D;
                if Disabled = Disabled::Yes then
                    if "Date Of Birth" <> 0D then
                        "Retirement date" := CalcDate(HrSetup."Disabled Retirement Age", "Date Of Birth");
            end;
        }
        field(81; "Date Of Birth"; Date)
        {
            Caption = 'Date Of Birth';
            trigger OnValidate()
            var
                myInt: Integer;
                 HrSetup: Record "Human Resources Setup";
                TestIn: Date;
                 GlobalFun: Codeunit "Global Functions";
                Datetext: text;
                MinimumAgeError: Label 'Date of Birth must be less than %1';
            begin
                HrSetup.Get();
                //rec.TestField("Date Of Birth");
                TestIn := CALCDATE(HrSetup."Min. Member Age", TODAY);
                Datetext := GlobalFun.FormatDate(TestIn);
                IF rec."Date of Birth" > CALCDATE(HrSetup."Min. Member Age", TODAY) THEN
                    ERROR(MinimumAgeError, Datetext);

                "Retirement date" := 0D;
                if "Date Of Birth" <> 0D then
                    "Retirement date" := CalcDate(HrSetup."Retirement Age", "Date Of Birth");

            end;

        }
        field(82; Age; Text[10])
        {
            Caption = 'Age';
            Editable = false;
        }
        field(83; "Date Of Join"; Date)
        {
            Caption = 'Date Of Join';
        }
        field(84; "Length Of Service"; Text[80])
        {
            Caption = 'Length Of Service';
        }
        field(85; "End Of Probation Date"; Date)
        {
            Caption = 'End Of Probation Date';
        }
        field(86; "Pension Scheme Join"; Date)
        {
            Caption = 'Pension Scheme Join';
        }
        field(87; "Time Pension Scheme"; Text[20])
        {
            Caption = 'Time Pension Scheme';
        }
        field(88; "Medical Scheme Join"; Date)
        {
            Caption = 'Medical Scheme Join';
        }
        field(90; "Date Of Leaving"; Date)
        {
            Caption = 'Date Of Leaving';
            trigger OnValidate()
            begin

                if "Termination Grounds" = 0 then
                    Error('Kindly Enter Reason for Leaving');
            end;
        }

        field(96; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
            Caption = 'Allow Overtime';
        }
        field(97; "Medical Scheme No."; Text[30])
        {
            Caption = 'Medical Scheme No.';

        }
        field(98; "Medical Scheme Head Member"; Text[30])
        {
            Caption = 'Medical Scheme Head Member';

        }
        field(99; "Number Of Dependants"; Integer)
        {
            Caption = 'Number Of Dependants';

        }
        field(100; "Medical Scheme Name"; Text[20])
        {
            Caption = 'Medical Scheme Name';

        }
        field(101; "Amount Paid By Employee"; Decimal)
        {
            Caption = 'Amount Paid By Employee';

        }
        field(102; "Amount Paid By Company"; Decimal)
        {
            Caption = 'Amount Paid By Company';

        }
        field(103; "Receiving Car Allowance ?"; Boolean)
        {
            Caption = 'Receiving Car Allowance ?';
        }
        field(104; "Second Language (R/W/S)"; Code[10])
        {
            Caption = 'Second Language (R/W/S)';
        }

        field(107; "Amount Reimbursed"; Decimal)
        {
            Caption = 'Amount Reimbursed';
        }
        field(108; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'UIF Country';
        }
        field(109; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
            Caption = 'Direct/Indirect';
        }
        field(110; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = 'Primary Skills Category';
        }
        field(111; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
            Caption = 'Level';
        }
        field(112; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            Caption = 'Termination Category';

        }
        field(113; "Job ID"; Code[30])
        {
            Description = 'To put description on Job title field';
            TableRelation = Job."No.";
            Caption = 'Job ID';
            trigger OnValidate()
            begin
                objJobs.Reset();
                objJobs.SetRange(objJobs."No.", "Job ID");
                if objJobs.Find('-') then
                    "Job Title" := objJobs.Description;
            end;
        }
        field(114; DateOfBirth; Date)
        {
            Caption = 'DateOfBirth';
            trigger OnValidate()
            begin
                //calculate age 02-05-1988
                yTODAY := Date2DMY(Today, 3); //2014

                yDOB := Date2DMY("Date Of Birth", 3);
                dDOB := Date2DMY("Date Of Birth", 1);
                mDOB := Date2DMY("Date Of Birth", 2);

                AppAge := yTODAY - yDOB;

                //calculate how many years remaining for this employee to retire : ret yr is 65
                noYrsToRetirement := 60 - AppAge;

                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear := yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                "Retirement date" := RetirementDate;
                // END ELSE
                // //IF HREmp.Disabled= HREmp.Disabled::Yes THEN
                ////calculate how many years remaining for this employee to retire : ret yr is 60
                //noYrsToRetirement:=70 - AppAge;

                ////add noYrsToRetirement to current year to get retirement year da
                //RetirementYear:= yTODAY + noYrsToRetirement;
                ////ERROR(FORMAT(RetirementYear));
                //RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                //"Retirement date":=RetirementDate;
                //END;
                //END;
            end;
        }

        field(121; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'Citizenship';
        }

        field(123; "User ID"; Code[60])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'User ID';

        }
        field(124; "Disabling Details"; Text[30])
        {
            Caption = 'Disabling Details';
        }
        field(125; "Disability Grade"; Text[30])
        {
            Caption = 'Disability Grade';
        }
        field(126; "Passport Number"; Text[30])
        {
            Caption = 'Passport Number';
        }
        field(127; "Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = 'Skills Category';
        }
        field(129; PensionJoin; Text[8])
        {
            Caption = 'PensionJoin';
        }
        field(132; "Manager Emp No"; Code[30])
        {
            Caption = 'Manager Emp No';
        }
        field(133; Temp; Text[20])
        {
            Caption = 'Temp';
        }
        field(134; "Employee Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
            Caption = 'Employee Qty';
            Editable = false;
        }
        field(135; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
            Caption = 'Employee Act. Qty';
            Editable = false;
        }
        field(136; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
            Caption = 'Employee Arc. Qty';
            Editable = false;
        }
        field(137; "Contract Location"; Text[10])
        {
            Description = 'Location where contract was closed';
            Caption = 'Contract Location';
        }
        field(138; "First Language Read"; Boolean)
        {
            Caption = 'First Language Read';
        }
        field(139; "First Language Write"; Boolean)
        {
            Caption = 'First Language Write';
        }
        field(140; "First Language Speak"; Boolean)
        {
            Caption = 'First Language Speak';
        }
        field(141; "Second Language Read"; Boolean)
        {
            Caption = 'Second Language Read';
        }
        field(142; "Second Language Write"; Boolean)
        {
            Caption = 'Second Language Write';
        }
        field(143; "Second Language Speak"; Boolean)
        {
            Caption = 'Second Language Speak';
        }
        field(144; "Custom Grading"; Code[20])
        {
            Caption = 'Custom Grading';
        }
        field(145; "PIN No."; Code[20])
        {
            Caption = 'PIN No.';
            trigger OnValidate()
            var
                myInt: Integer;
                hrEmplo: Record "HR Employees";
            begin
                hrEmplo.Reset();
                hrEmplo.SetRange("PIN No.", rec."PIN No.");
                hrEmplo.SetRange(Status, Status::Active);
                if hrEmplo.FindFirst() then
                    Error('You cannot share KRA pin with employee No. %1', hrEmplo."No.");
                if StrLen("PIN No.") <> 11 then Error('P.I.N Number length must be 11 characters');
                // if StrPos(hrEmplo."No.")<>4 then Error();

            end;
        }
        field(146; "NSSF No."; Code[20])
        {
            Caption = 'NSSF No.';
        }
        field(147; "NHIF No."; Code[20])
        {
            Caption = 'NHIF No.';
        }
        field(148; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(149; "Grounds for Term. Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(150; "Sacco Staff No"; Code[20])
        {
            Caption = 'Sacco Staff No';
        }
        field(151; "Period Filter"; Date)
        {
            Caption = 'Period Filter';
        }
        field(152; "HELB No"; Text[10])
        {
            Caption = 'HELB No';
        }
        field(153; "Co-Operative No"; Text[30])
        {
            Caption = 'Co-Operative No';
        }
        field(154; "Wedding Anniversary"; Date)
        {
            Caption = 'Wedding Anniversary';
        }
        field(157; "Cost Center Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
            Caption = 'Cost Center Code';
            trigger OnValidate()
            begin
                // if SalCard.Get("No.") then begin
                //     SalCard.Nationality := "Cost Center Code";
                //     SalCard.Modify();
                // end;
            end;
        }

        field(159; "Company E-Mail"; Text[100])
        {
            Caption = 'Company E-Mail';
            trigger OnValidate()
            var
                myInt: Integer;
                emila: Codeunit Email;
            begin

            end;
        }
        field(161; Tribe; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Tribe));
            Caption = 'Tribe';
        }
        field(162; Religion; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Religion));
            Caption = 'Religion';
        }
        field(163; "Job Title"; Text[50])
        {
            Editable = false;
            Caption = 'Job Title';
        }
        field(164; "Post Office No"; Text[20])
        {
            Caption = 'Post Office No';
        }
        field(165; "Posting Group"; Code[20])
        {
            NotBlank = false;
            // TableRelation = "prEmployee Posting Group".Code;
            Caption = 'Posting Group';
        }
        field(166; "Payroll Posting Group"; Code[20])
        {
            Caption = 'Payroll Posting Group';
        }
        field(167; "Served Notice Period"; Boolean)
        {
            Caption = 'Served Notice Period';
        }
        field(168; "Exit Interview Date"; Date)
        {
            Caption = 'Exit Interview Date';
        }
        field(169; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Exit Interview Done by';
        }
        field(170; "Allow Re-Employment In Future"; Boolean)
        {
            Caption = 'Allow Re-Employment In Future';
        }
        field(171; "Medical Scheme Name #2"; Text[30])
        {
            Caption = 'Medical Scheme Name #2';

        }
        field(172; "Resignation Date"; Date)
        {
            Caption = 'Resignation Date';
        }
        field(173; "Suspension Date"; Date)
        {
            Caption = 'Suspension Date';
        }
        field(174; "Demised Date"; Date)
        {
            Caption = 'Demised Date';
        }
        field(175; "Retirement date"; Date)
        {
            Caption = 'Retirement date';
            trigger OnValidate()
            begin
                //calculate age 02-05-1988
                yTODAY := Date2DMY(Today, 3); //2014

                yDOB := Date2DMY("Date Of Birth", 3);
                dDOB := Date2DMY("Date Of Birth", 1);
                mDOB := Date2DMY("Date Of Birth", 2);

                AppAge := yTODAY - yDOB;
                //HREmp.FIND('-');
                // IF HREmp.Disabled= HREmp.Disabled::No THEN BEGIN
                ////calculate how many years remaining for this employee to retire : ret yr is 60
                //noYrsToRetirement:=60 - AppAge;

                ////add noYrsToRetirement to current year to get retirement year da
                //RetirementYear:= yTODAY + noYrsToRetirement;
                ////ERROR(FORMAT(RetirementYear));
                //RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                //"Retirement date":=RetirementDate;
                //END ELSE
                // IF HREmp.Disabled= HREmp.Disabled::Yes THEN
                ////calculate how many years remaining for this employee to retire : ret yr is 60
                //noYrsToRetirement:=70 - AppAge;

                ////add noYrsToRetirement to current year to get retirement year da
                //RetirementYear:= yTODAY + noYrsToRetirement;
                ////ERROR(FORMAT(RetirementYear));
                //RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                //"Retirement date":=RetirementDate;
                ////END;
                ////END;
            end;
        }
        field(176; "Retrenchment date"; Date)
        {
            Caption = 'Retrenchment date';
        }
        field(177; Campus; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('CAMPUS'));
            Caption = 'Campus';
        }
        field(178; Permanent; Boolean)
        {
            Caption = 'Permanent';
        }
        field(179; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
            Caption = 'Library Category';
        }
        field(180; Category; Code[20])
        {
            Caption = 'Category';
        }
        field(181; "Payroll Departments"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            Caption = 'Payroll Departments';
        }
        field(188; "Salary Grade"; Code[20])
        {
            Caption = 'Salary Grade';
            //TableRelation = "Payment Terms".Field1396040;
        }
        field(189; "Company Type"; Option)
        {
            OptionCaption = 'Others,USAID';
            OptionMembers = Others,USAID;
            Caption = 'Company Type';
        }
        field(190; "Main Bank"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Main Bank';
        }
        field(191; "Branch Bank"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'Branch Bank';
        }
        field(192; "Lock Bank Details"; Boolean)
        {
            Caption = 'Lock Bank Details';
        }
        field(193; "Bank Account Number"; Code[20])
        {
            Caption = 'Bank Account Number';
        }
        field(195; "Payroll Code"; Code[20])
        {
            Caption = 'Payroll Code';
        }
        field(196; "Holiday Days Entitlement"; Decimal)
        {
            Caption = 'Holiday Days Entitlement';
        }
        field(197; "Holiday Days Used"; Decimal)
        {
            Caption = 'Holiday Days Used';
        }
        field(198; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
            Caption = 'Payment Mode';
        }
        field(199; "Hourly Rate"; Decimal)
        {
            Caption = 'Hourly Rate';
        }
        field(200; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
        }
        field(300; "Social Security No."; Code[20])
        {
            Caption = 'Social Security No.';
        }
        field(301; "Pension House"; Code[20])
        {
            // TableRelation = "prInstitutional Membership"."Institution No" where("Group No" = const('PENSION'));
            Caption = 'Pension House';
        }
        field(302; "Salary Notch/Step"; Code[20])
        {
            Caption = 'Salary Notch/Step';
        }
        field(303; "Status Change Date"; Date)
        {
            Caption = 'Status Change Date';
        }
        field(304; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Previous Month Filter';
        }
        field(305; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Current Month Filter';
        }
        field(306; "Prev. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Prev. Basic Pay';
        }
        field(307; "Curr. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Curr. Basic Pay';
        }
        field(308; "Prev. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Prev. Gross Pay';
        }
        field(309; "Curr. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Curr. Gross Pay';
        }
        field(310; "Gross Income Variation"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Gross Income Variation';
        }
        field(311; "Basic Pay 2"; Decimal)
        {
            Editable = false;
            Caption = 'Basic Pay 2';
        }
        field(312; "Net Pay"; Decimal)
        {
            Caption = 'Net Pay';
        }
        field(313; "Transaction Amount"; Decimal)
        {
            Caption = 'Transaction Amount';
        }
        field(314; "Transaction Code Filter"; Text[30])
        {
            FieldClass = FlowFilter;
            // TableRelation = "Bank Bal. Alert Buffer"."Line No.";
            Caption = 'Transaction Code Filter';
        }
        field(317; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
            Caption = 'Account Type';
        }
        field(318; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('LOC/DIV'));
            Caption = 'Location/Division Filter';
        }
        field(319; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
            Caption = 'Department Filter';
        }
        field(320; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COSTCENTRE'));
            Caption = 'Cost Centre Filter';
        }
        field(323; "Payroll Type"; Option)
        {
            Description = 'General,Consultants,Seconded Staff';
            OptionCaption = 'General,Consultants,Seconded Staff';
            OptionMembers = General,Consultants,"Seconded Staff";
            Caption = 'Payroll Type';
        }
        field(324; "Employee Classification"; Code[20])
        {
            Description = 'Service';
            // TableRelation = "Employee Class".Code;
            Caption = 'Employee Classification';
        }
        field(328; "Department Name"; Text[50])
        {
            // CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            // FieldClass = FlowField;
            Caption = 'Department Name';
            Editable = false;
        }
        field(329; "County Name"; Text[50])
        {
            // CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            // FieldClass = FlowField;
            Caption = 'Workstation Name';
            Editable = false;
        }
        field(2004; "Total Leave Taken"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Leave Entry Type" = const(Negative),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Posting Date" = filter('07/05/24..06/30/25'),
                                                                             "Journal Batch Name" = const('POSITIVE')));
            DecimalPlaces = 2 : 2;
            ObsoleteState=Removed;
            FieldClass = FlowField;
            Caption = 'Total Leave Taken';
            Editable = false;
        }
        field(2006; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
            Caption = 'Total (Leave Days)';
        }
        field(2007; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Caption = 'Cash - Leave Earned';
        }
        field(2008; "Reimbursed Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = filter('07/05/23..06/30/24'),
                                                                             Closed = const(false),
                                                                             "Leave Entry Type" = const(Positive),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Document No." = const('LV2023/2024'),
                                                                             "Leave Posting Description" = const('Carry Forward Days on07/04/23')));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
            ObsoleteState=Removed;
            Caption = 'Reimbursed Leave Days';
            Editable = false;
            trigger OnValidate()
            begin
                // Validate("Allocated Leave Days");
            end;
        }
        field(2009; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Caption = 'Cash per Leave Day';
        }
        field(2023; "Allocated Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = filter('07/05/23..06/30/24'),
                                                                             Closed = const(false),
                                                                             "Leave Entry Type" = const(Positive),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Document No." = const('LV2023/2024'),
                                                                             "Leave Posting Description" = const('Leave Allocation on07/04/23')));
            FieldClass = FlowField;
            Caption = 'Allocated Leave Days';
            Editable = false;
            ObsoleteState=Removed;
            trigger OnValidate()
            begin
                /*
               CALCFIELDS("Total Leave Taken");
               "Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
               //SUM UP LEAVE LEDGER ENTRIES
               "Leave Balance" := "Total (Leave Days)" - "Total Leave Taken";
               //TotalDaysVal := Rec."Total Leave Taken";
                  */

                // CalcFields("Leave Balance");
               // "Leave Balance" := "Total (Leave Days)" - "Total Leave Taken";

            end;
        }
        field(2024; "End of Contract Date"; Date)
        {
            Caption = 'End of Contract Date';
        }
        field(2040; "Leave Period Filter"; Code[20])
        {
            Caption = 'Leave Period Filter';
        }
        field(3899; "Mutliple Bank A/Cs"; Boolean)
        {
            Caption = 'Mutliple Bank A/Cs';
        }
        field(3900; "No. Of Bank A/Cs"; Integer)
        {
            CalcFormula = count("HR Employee Bank Accounts" where("Bank  Code" = filter(<> ''),
                                                                   "Branch Code" = filter(<> ''),
                                                                   "A/C  Number" = filter(<> ''),
                                                                   "Employee Code" = field("No.")));
            FieldClass = FlowField;
            Caption = 'No. Of Bank A/Cs';
            Editable = false;
        }
        field(3971; "Annual Leave Account"; Decimal)
        {
            Caption = 'Annual Leave Account';
        }
        field(3972; "Compassionate Leave Acc."; Decimal)
        {
            Caption = 'Compassionate Leave Acc.';
        }
        field(3975; "Sick Leave Acc."; Decimal)
        {
            Caption = 'Sick Leave Acc.';
        }
        field(3976; "Study Leave Acc"; Decimal)
        {
            Caption = 'Study Leave Acc';
        }
        field(3977; "Appraisal Method"; Option)
        {
            OptionCaption = ' ,Normal Appraisal,360 Appraisal';
            OptionMembers = " ","Normal Appraisal","360 Appraisal";
            Caption = 'Appraisal Method';
        }
        field(3978; "Employee Type Primary"; Option)
        {
            OptionMembers = " ",Primary,Secondary,Board;
            Caption = 'Employee Type Primary';
        }

        field(39003900; "Global Dimension 1 Code"; Code[20])
        {
            //CaptionClass = '1,1,1';
            Caption = 'Home County';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            var
                myInt: Integer;
                ValuesRE: Record "Dimension Value";
            begin
                ValuesRE.Reset();
                ValuesRE.SetRange(ValuesRE.Code, Rec."Global Dimension 1 Code");
                if ValuesRE.FindFirst() then
                    Rec."Global Dimension 1 Code" := ValuesRE.Name;

            end;
        }
        field(39003901; "Global Dimension 2 Code"; Code[20])
        {
            // CaptionClass = '1,1,2';
            Caption = 'Directorate Code';

            FieldClass = Normal;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger OnValidate()
            var
                myInt: Integer;
                Dimension: Record "Dimension Value";
            begin
                Dimension.reset;
                Dimension.SetRange(Code, Rec."Global Dimension 2 Code");
                if Dimension.FindFirst() then
                    rec."Dimectorates Name" := Dimension.Code;
            end;
        }
        field(39003902; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
            Caption = 'Department';
            // CaptionClass = '1,1,2';

            trigger OnValidate()
            var
                myInt: Integer;
                // Responsblece: Record "Responsibility Center BR NEW";
            begin
                // Responsblece.Reset();
                // Responsblece.SetRange(Code, Rec."Responsibility Center");
                // if Responsblece.FindFirst() then
                //     "Department Name" := Responsblece.Name;

            end;
        }
        field(39003903; HR; Boolean)
        {
            Caption = 'HR';
        }
        field(39003904; "Date Of Joining the Company"; Date)
        {
            Caption = 'Date Of Joining the Company';
        }
        field(39003906; "Termination Grounds"; Option)
        {
            OptionCaption = ' ,Resignation,Non-Renewal Of Contract,Dismissal,Retirement,Death,Other';
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            Caption = 'Termination Grounds';
        }
        field(39003907; "Cell Phone Number"; Text[20])
        {
            ExtendedDatatype = PhoneNo;
            Caption = 'Cell Phone Number';
        }
        field(39003908; Grade; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade';
        }
        field(39003909; "Employee UserID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Employee UserID';
        }
        field(39003910; "Leave Balance"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Posting Date" = filter('07/05/23..06/30/24')));
            FieldClass = FlowField;
            ObsoleteState=Removed;
            Caption = 'Leave Balance';
            Editable = false;
        }
        field(39003911; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
            Caption = 'Leave Status';
        }
        field(39003912; "Pension Scheme Join Date"; Date)
        {
            Caption = 'Pension Scheme Join Date';
        }
        field(39003913; "Medical Scheme Join Date"; Date)
        {
            Caption = 'Medical Scheme Join Date';
        }
        field(39003914; "Leave Type Filter"; Code[20])
        {
            TableRelation = "HR Leave Types";
            Caption = 'Leave Type Filter';
        }
        field(39003915; "Acrued Leave Days"; Decimal)
        {
            Caption = 'Acrued Leave Days';
        }
        field(39003916; Supervisor; Boolean)
        {
            Caption = 'Supervisor';
        }
        field(39003918; "Grant/Compliance Officer"; Boolean)
        {
            Caption = 'Grant/Compliance Officer';
        }

        field(39003925; "Basic Pay"; Decimal)
        {
            CalcFormula = lookup("PR Salary Card"."Basic Pay" where("Employee Code" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Basic Pay';
        }
        field(39003926; "Other Name"; Text[20])
        {
            Caption = 'Other Name';
        }
        field(39003927; "Exist IN User Setup"; Boolean)
        {
            CalcFormula = exist("User Setup" where("User ID" = field("User ID")));
            FieldClass = FlowField;
            Caption = 'Exist IN User Setup';
            Editable = false;
        }
        field(39003928; "Commisioner?"; Boolean)
        {
            Caption = 'Commisioner?';
        }
        field(39003930; "On Leave"; Boolean)
        {
            Caption = 'On Leave';
        }
        field(39003931; "Job Group Range"; Code[20])
        {
            Caption = 'Job Group Range';
        }
        field(39003932; "Contract Duration"; Code[10])
        {
            Caption = 'Contract Duration';
            trigger OnValidate()
            begin
                "Contract End Date" := 0D;

                //IF ("Contract Type" = "Contract Type"::Contract) AND ("Contract Duration" <> '') THEN
                //BEGIN
                "Contract End Date" := CalcDate("Contract Duration", "Contract Start Date");
                //END;

                if ("Contract Type" = "Contract Type"::Probation) then;
                //  "Contract Duration":='6M';
                //  "Contract End Date":=CALCDATE("Contract Duration","Date Of Joining the Company");
            end;
        }
        field(39003933; DAge; Text[50])
        {
            Caption = 'DAge';
            trigger OnValidate()
            begin
                if DAge <= '18Y' then
                    Error('The Staff Is UnderAge');
            end;
        }
        field(39003934; DPension; Text[40])
        {
            Caption = 'DPension';
        }
        field(39003935; "New Basic Pay"; Decimal)
        {
            Caption = 'New Basic Pay';
        }
        field(39003936; "Incremental Month"; Option)
        {
            OptionMembers = None,January,February,March,April,May,June,July,August,September,October,November,December;
            Caption = 'Incremental Month';
        }
        field(39003937; "Approval Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
            Caption = 'Approval Status';
            trigger OnValidate()
            var
                HrEemployeRec: Record "HR Employees";
                HREmployeeTest: Record "HR Employees";
            begin
                "Status Change Date" := Today;
                if rec."Approval Status" = Rec."Approval Status"::Approved then begin
                    HrEemployeRec.Reset();
                    HrEemployeRec.SetRange("No.", rec."No.");
                    if not HrEemployeRec.FindFirst() then begin
                        HrEemployeRec.Init();
                        HrEemployeRec."No." := Rec."No.";
                        HrEemployeRec."First Name" := Rec."First Name";
                        HrEemployeRec."Middle Name" := rec."Middle Name";
                        HrEemployeRec."Last Name" := Rec."Last Name";
                        HrEemployeRec."Full Name" := rec."Full Name";
                        HrEemployeRec."Employee Type" := rec."Employee Type";
                        HrEemployeRec."Responsibility Center" := rec."Responsibility Center";
                        HrEemployeRec."Department Name" := rec."Department Name";
                        HrEemployeRec."Marital Status" := rec."Marital Status";
                        HrEemployeRec."Date Of Join" := rec."Date Of Join";
                        // HrEemployeRec."Employee Type" := rec."Employee Type";
                        HrEemployeRec."Date Of Joining the Company" := rec."Date Of Joining the Company";
                        HrEemployeRec."Pay Per Period" := Rec."Pay Per Period";
                        HrEemployeRec."Pay Period" := rec."Pay Period";
                        HrEemployeRec."Current Duty Station" := rec."Current Duty Station";
                        HrEemployeRec."Job ID" := rec."Job ID";
                        HrEemployeRec.Gender := rec.Gender;
                        HrEemployeRec.Title := Rec.Title;
                        HrEemployeRec."Company E-Mail" := rec."Company E-Mail";
                        HrEemployeRec.Disabled := rec.Gender;
                        HrEemployeRec."Job Title" := rec."Job Title";
                        HrEemployeRec."Job Group Range" := rec."Job Group Range";
                        HrEemployeRec.Initials := Rec.Initials;
                        HrEemployeRec."Postal Address" := Rec."Postal Address";
                        HrEemployeRec."Residential Address" := rec."Residential Address";
                        HrEemployeRec.City := Rec.City;
                        HrEemployeRec."Responsibility Center" := rec."Responsibility Center";
                        HrEemployeRec.Validate(HrEemployeRec."Responsibility Center");
                        HrEemployeRec."User ID" := Rec."User ID";
                        HrEemployeRec.Citizenship := rec.Citizenship;
                        HrEemployeRec."Date of Current Employment" := rec."Date of Current Employment";
                        HrEemployeRec."Post Code" := Rec."Post Code";
                        HrEemployeRec."Cell Phone Number" := rec."Cell Phone Number";
                        HrEemployeRec."Home Phone Number" := rec."Home Phone Number";
                        HrEemployeRec."Home District" := Rec."Home District";
                        HrEemployeRec."Date Of Birth" := rec."Date Of Birth";
                        HrEemployeRec."Contract Duration" := rec."Contract Duration";
                        HrEemployeRec."Contract End Date" := Rec."Contract End Date";
                        HrEemployeRec.County := Rec.County;
                        HrEemployeRec."Hander No":=rec."Hander No";
                        HrEemployeRec.Validate(HrEemployeRec."Hander No");
                        HrEemployeRec."County Name" := Rec."County Name";
                        HrEemployeRec."Account Type" := Rec."Account Type";
                        HrEemployeRec.Age := Rec.Age;
                        HrEemployeRec."Global Dimension 2 Code" := rec."Global Dimension 2 Code";
                        HrEemployeRec.Validate(HrEemployeRec."Global Dimension 2 Code");
                        HrEemployeRec.Status := HrEemployeRec.Status::Active;
                        HrEemployeRec."NSSF No." := Rec."NSSF No.";
                        HrEemployeRec."Net Pay" := Rec."Net Pay";
                        HrEemployeRec."NHIF No." := rec."NHIF No.";
                        HrEemployeRec."Passport Number" := rec."Passport Number";
                        HrEemployeRec."Basic Pay" := Rec."Basic Pay";
                        HrEemployeRec."Bank Account Number" := HrEemployeRec."Bank Account Number";
                        HrEemployeRec."Branch Bank" := rec."Branch Bank";
                        HrEemployeRec."Contract Type" := rec."Contract Type";
                        HrEemployeRec."Contract Start Date" := rec."Contract Start Date";
                        HrEemployeRec."PIN No." := rec."PIN No.";
                        HrEemployeRec.Position := rec.Position;
                        HrEemployeRec.CalcFields(Picture);
                        rec.CalcFields(Picture);
                        HrEemployeRec.Picture := Rec.Picture;
                        HrEemployeRec."E-Mail" := rec."E-Mail";
                        HrEemployeRec."ID Number" := rec."ID Number";
                        HrEemployeRec.Insert();
                        InsertNextofkin();
                        HREmployeeTest.Reset();
                        HREmployeeTest.SetRange("No.", HrEemployeRec."No.");
                        if HREmployeeTest.FindFirst() then begin
                            HREmployeeTest.Status := HREmployeeTest.Status::Active;
                            HREmployeeTest.Modify();
                        end;
                        Message('Employee details Created successfully');
                    end;
                end;
            end;
        }
        field(39003938; "Passport Expiry Date"; Date)
        {
            Caption = 'Passport Expiry Date';
        }
        field(39003939; "Date of Current Employment"; Date)
        {
            Caption = 'Date of Current Employment';
        }
        field(39003940; "Type of Employee"; Option)
        {
            OptionMembers = Primary,Secondary;
            Caption = 'Type of Employee';
        }
        field(39003941; "Residential status"; Option)
        {
            OptionMembers = Resident,"Non-Resident";
            Caption = 'Residential status';
        }
        field(39003944; "Is Driver"; Boolean)
        {
            Caption = 'Is Driver';
        }
        field(39003945; "Exemption Certificate No."; Code[20])
        {
            Caption = 'Exemption Certificate No.';
        }
        field(39003946; "Stop Pay"; Boolean)
        {
            Caption = 'Stop Pay';
        }
        field(39003947; "Contract Start Date"; Date)
        {
            Caption = 'Contract Start Date';
            trigger OnValidate()
            begin
                "Contract End Date" := 0D;

                if ("Contract Type" = "Contract Type"::Contract) and ("Contract Duration" <> '') then
                    "Contract End Date" := CalcDate("Contract Duration", "Contract Start Date");

                if ("Contract Type" = "Contract Type"::Probation) then;
                //  "Contract Duration":='6M';
                //  "Contract End Date":=CALCDATE("Contract Duration","Date Of Joining the Company");
            end;
        }

        field(39003949; "Home District"; Code[20])
        {
             TableRelation = "HR Lookup Values".Code where(Type = filter("Home District"));
            Caption = 'Home District';
        }
        field(39003950; Division; Text[30])
        {
            Caption = 'Division';
        }
        field(39003951; Location; Text[30])
        {
            Caption = 'Location';
        }
        field(39003952; "Sub Location"; Text[20])
        {
            Caption = 'Sub Location';
        }
        field(39003953; Ethnicity; Text[20])
        {
            Caption = 'Ethnicity';
        }
        field(39003985; "Reason For Acting"; Option)
        {
            OptionCaption = ' ,Demise,Resignation,Termination,Suspension';
            OptionMembers = " ",Demise,Resignation,Termination,Suspension;
            Caption = 'Reason For Acting';
        }
        field(39003986; "Responsibility Centre2"; Code[15])
        {
            TableRelation = "Responsibility Center".Code;
            Caption = 'Department';
            CaptionClass = '1,1,2';

            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Responsibility Center";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Responsibility Center");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;
        }
        field(39003987; "If Acted?"; Boolean)
        {
            Caption = 'If Acted?';
        }
        field(39003988; "Sitting C.E.O"; Boolean)
        {
            Caption = 'Sitting C.E.O';
        }
        // field(39003989; DRetirement; Decimal)
        // {
        //     Caption = 'DRetirement';
        // }
        field(39003990; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }


        field(4001; "Current Duty Station"; Code[50])
        {
            Caption = 'Current Duty Station';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            // DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
                DimesonsionVA: Record "Dimension Value";
            begin
                DimesonsionVA.Reset();
                DimesonsionVA.SetRange(Code, Rec."Current Duty Station");
                if DimesonsionVA.FindFirst() then
                    Rec."Current Duty Station" := DimesonsionVA.Name;
            end;
        }

        field(4002; "EMP Transfer Date"; Date)
        {
            Caption = 'EMP Transfer Date';
            DataClassification = CustomerContent;
        }


        field(4003; "EMP Reporting Date"; Date)
        {
            Caption = 'EMP Reporting Date';
            DataClassification = CustomerContent;
        }

        field(4005; "Head Of Station"; Boolean)
        {
            Caption = 'Head Of Station';
            DataClassification = CustomerContent;
        }
        field(40045; "Highest level"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employee Qualifications"."Line No." where("Employee No." = field("No."));
            trigger OnValidate()
            var
                myInt: Integer;
                HrQualif: Record "HR Employee Qualifications";
            begin
                HrQualif.Reset();
                HrQualif.SetRange("Employee No.", Rec."No.");
                HrQualif.SetRange("Line No.", Rec."Highest level");
                if HrQualif.FindFirst() then
                    Rec."Highest Leverl Description" := HrQualif.Description;
            end;
        }
        field(40046; "Highest Leverl Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(50004; County; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Workstation';
            trigger OnValidate()
            var
                myInt: Integer;
                Dimensi: Record "Dimension Value";
            begin
                Dimensi.Reset();
                Dimensi.SetRange(Code, rec.County);
                if Dimensi.FindFirst() then
                    rec."County Name" := Dimensi.Name;

            end;
        }
        field(50045; "Dimectorates Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50046; "Employee Type"; Option)
        {
            OptionMembers = Normal,Deployed;
            Caption = 'Employee Type';
        }
        field(50047; "Hander No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation=Employee."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                HrEmployee:Record Employee;
            begin
                HrEmployee.Reset();
                HrEmployee.SetRange("No.",rec."Hander No");
                if HrEmployee.Find('-') then begin
                    rec."Hander Name":=HrEmployee."Full Name";
                end;
                
            end;
        }
        field(50048; "Hander Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Initials, "First Name", "Middle Name", "Last Name") { }
    }

    trigger OnDelete()
    begin
        if rec."Approval Status" <> Rec."Approval Status"::Open then
            Error('Deleting  a record on status %1 is not allowed', Rec."Approval Status");
    end;

    trigger OnInsert()
    var
    HrSetup:Record "Human Resources Setup";
    begin
        "Last Date Modified" := Today;
        if "No." = '' then begin
            HrSetup.Get();
            HrSetup.TestField("Applicants Nos.");
            NoSeriesMgt.InitSeries(HrSetup."Applicants Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        //"Last Date Modified By" := USERID;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    var
        PostCode: Record "Post Code";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        // HrSetup: Record "HR Setup";
        SalCard: Record "PR Salary Card";
        PRPayrollPeriod: Record "PR Payroll Periods";
        objJobs: Record Job;
        yDOB: Integer;
        yTODAY: Integer;
        noYrsToRetirement: Integer;
        RetirementYear: Integer;
        AppAge: Integer;
        RetirementDate: Date;
        dDOB: Integer;
        mDOB: Integer;
        HasHRSetup: Boolean;
        PRPeriodTrans: Record "PR Period Transactions";
        Text0005: Label 'Please note that ALL PAYROLL TRANSACTIONS PROCESSED for [EMPLOYEE  :: %1 - %2  ] in the [CURRENT PAYROLL PERIOD :: %3 ] will be deleted. \\Proceed?';

    local procedure fn_FullName()
    begin
        "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
    end;

    //[Scope('OnPrem')]
    procedure GetHRSetup()
    begin
        // if not HasHRSetup then begin
        //     HrSetup.Get();
        //     HasHRSetup := true;
        // end;
    end;

    procedure InsertNextofkin()
    var
        NextOfKin: Record "Next Of KIn Application";
        NextOfKinApp: Record "HR Employee Kin";

    begin
        NextOfKinApp.Reset;
        NextOfKinApp.SetRange(NextOfKinApp."Employee Code", Rec."No.");
        if NextOfKinApp.Find('-') then
            NextOfKinApp.DeleteAll;
        NextOfKin.Reset;
        NextOfKin.SetRange(NextOfKin."Employee Code", rec."No.");
        if NextOfKin.Find('-') then begin
            repeat
                NextOfKinApp.Init;
                NextOfKinApp."Line No." := NextOfKinApp."Line No." + 1;
                NextOfKinApp."Employee Code" := rec."No.";
                NextOfKinApp.Name := NextOfKin.Name;
                NextOfKinApp.Relationship := NextOfKin.Relationship;
                NextOfKinApp.Type := NextOfKin.Type;
                NextOfKinApp."Date of Birth" := NextOfKin."Date of Birth";
                NextOfKinApp.Address := NextOfKin.Address;
                NextOfKinApp."E-mail" := NextOfKin."E-mail";
                NextOfKinApp."Home Tel No" := NextOfKin."Home Tel No";
                NextOfKinApp."Percentage Shares" := NextOfKin."Percentage Shares";
                NextOfKinApp."ID No/Passport No" := NextOfKin."ID No/Passport No";
                NextOfKinApp.Occupation := NextOfKin.Occupation;
                NextOfKinApp."Office Tel No" := NextOfKin."Office Tel No";
                NextOfKinApp.Insert;
            until NextOfKin.Next = 0;
        end;
    end;
}

