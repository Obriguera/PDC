const addRemoveBtnListener = (button) => {
    button.addEventListener('click', async () => {
        try {
            jUtils.clean('iError');
            jUtils.showLoading();

            const li = button.closest('li');
            const items = document.querySelectorAll('#iList li');

            const response = await fetch('./remove.jsp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    removedItem: [...items].indexOf(li)
                })
            });

            if (!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            li.remove();
        }
        catch(error) {
            jUtils.show('iError', error.message);
        }
        finally {
            jUtils.hideLoading();
        }
    });
};

document.getElementById('iForm').addEventListener('submit', async (event) => {
    try {
        event.preventDefault();

        jUtils.clean('iError');
        jUtils.showLoading();

        const data = document.getElementById('iData');

        const response = await fetch('./save.jsp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                item: data.value
            })
        });

        if (!response.ok) {
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        const html = await response.text();
        const list = document.getElementById('iList');

        list.insertAdjacentHTML('beforeend', html);
        data.value = '';

        //Programo el evento click del botón asociado al ítem agregado
        const newButton = list.lastElementChild.querySelector('[name=btn-remove]');
        if (newButton) {
            addRemoveBtnListener(newButton);
        }
    }
    catch(error) {
        jUtils.show('iError', error.message);
    }
    finally {
        jUtils.hideLoading();
    }
});

document.querySelectorAll('[name=btn-remove]').forEach((button) => addRemoveBtnListener(button));
