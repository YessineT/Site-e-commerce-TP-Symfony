import './bootstrap.js';
/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */
import './styles/app.css';

// Multi-step form functionality
document.addEventListener('DOMContentLoaded', () => {
    const formSteps = document.querySelectorAll('.form-step');
    const nextBtn = document.getElementById('nextBtn');
    const prevBtn = document.getElementById('prevBtn');
    const submitBtn = document.getElementById('submitBtn');
    const steppers = document.querySelectorAll('.stepper');
    let currentStep = 0;

    // Initialize first step
    showStep(currentStep);

    // Next button click
    nextBtn.addEventListener('click', () => {
        if (validateStep(currentStep)) {
            currentStep++;
            showStep(currentStep);
        }
    });

    // Previous button click
    prevBtn.addEventListener('click', () => {
        currentStep--;
        showStep(currentStep);
    });

    function showStep(step) {
        // Hide all steps
        formSteps.forEach((step) => step.classList.remove('active'));

        // Show current step
        formSteps[step].classList.add('active');

        // Update stepper UI
        steppers.forEach((stepper, index) => {
            stepper.classList.toggle('active', index <= step);
        });

        // Update button visibility
        prevBtn.disabled = step === 0;
        nextBtn.style.display = step === formSteps.length - 1 ? 'none' : 'inline-block';
        submitBtn.style.display = step === formSteps.length - 1 ? 'inline-block' : 'none';
    }

    function validateStep(step) {
        // Add validation logic for each step
        return true;
    }

    // Thumbnail preview
    document.querySelector('input[type="file"]').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                document.getElementById('thumbnailPreview').src = event.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

    // Free game toggle
    document.querySelector('#game_isFree').addEventListener('change', function(e) {
        document.getElementById('freeUntilContainer').style.display =
            e.target.checked ? 'block' : 'none';
    });
});

// Initialize Dropzone for screenshots
Dropzone.autoDiscover = false;
const myDropzone = new Dropzone("#screenshotsDropzone", {
    url: "/upload/screenshots",
    paramName: "screenshot",
    maxFiles: 5,
    acceptedFiles: "image/*",
    addRemoveLinks: true,
    dictDefaultMessage: "Drag & drop screenshots here",
    dictRemoveFile: "Remove",
    init: function() {
        this.on("success", function(file, response) {
            file.previewElement.classList.add("dz-success");
            // Add hidden input to form with file ID
        });
    }
});