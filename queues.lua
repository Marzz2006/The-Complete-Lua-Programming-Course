--insert items from the rear of the queue
--pull items form the front of the queue

--Create New Queue
function create_queue()
    return {front = 1, rear = 0}
end

--Check if Queue is Empty
function isEmpty(queue)
    return queue.front > queue.rear
end

--Enqueue an element to the rear of the Queue
function enqueue(queue, item)
    queue.rear = queue.rear + 1
    queue[queue.rear] = item
end

--Dequeue an elemt from the front of the Queue
function dequeue(queue)
    if not isEmpty(queue) then
        local item = queue[queue.front]
        queue[queue.front] = nil
        queue.front = queue.front + 1
        return item
    end
end

--Get the element at the front of the Queue
function front(queue)
    if not isEmpty(queue) then
        return queue[queue.front]
    end
end

-- Get the size of the Queue
function size(queue)
    return queue.rear - queue.front + 1
end
